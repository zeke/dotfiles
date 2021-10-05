# configure these
GCP_USER=z
GCP_INSTANCE=zeke-dev-gpu
GCP_ZONE=us-central1-f

alias gpu_on="gcloud compute instances start --zone $GCP_ZONE $GCP_INSTANCE"
alias gpu_off="gcloud compute instances stop --zone $GCP_ZONE $GCP_INSTANCE"
alias gpu_ssh="gcloud compute ssh --zone $GCP_ZONE $GCP_INSTANCE"

# use rsync to continuously push local changes to your remote instance
# while matching the local directory structure 
function gpu_push() {
  # pluck the instance's current IP out of the gcloud instance table
  local GCP_IP=$(gcloud compute instances list | grep $GCP_INSTANCE | tr -s " " | cut -f5 -d' ')
  echo "GCP_IP: $GCP_IP"

  # turn `/Users/sally/foo/bar` into `~/foo/bar`
  local GENERIC_WD="${PWD/`eval echo ~$USER`/"~"}"
  echo "GENERIC_WD: $GENERIC_WD"

  # create a path on the remote machine that matches the current path
  # then sync continuously
  while true; do rsync -e "ssh -i ~/.ssh/google_compute_engine" -avz --rsync-path="mkdir -p $GENERIC_WD && rsync" --exclude .git . "$GCP_USER@$GCP_IP:$GENERIC_WD"; done
}

function gpu_create_instance() {
  set -x
  name=${1-zeke-dev-gpu}
  # zone=${2-us-central1-c}
  zone=${2-us-central1-f}
  gcloud compute instances create \
          $name \
          --zone=$zone \
          --machine-type=n1-standard-4 \
          --accelerator type=nvidia-tesla-t4,count=1 \
          --boot-disk-size=500GB \
          --image-project=deeplearning-platform-release \
          --image-family=common-cu110 \
          --maintenance-policy TERMINATE \
          --restart-on-failure \
          --scopes=default,storage-rw \
          --metadata="install-nvidia-driver=True"
}
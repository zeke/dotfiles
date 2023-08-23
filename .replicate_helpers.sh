train_sdxl() {
# Usage:
  # 0. Gather some images in a local directory
  # 1. Create a model at https://replicate.com/create
  # 2. Change to directory full of images: `cd ~/Desktop/this-is-fine`
  # 3. Set REPLICATE_API_TOKEN
  # 3. Run with model name and token name as arguments: `train_sdxl zeke/this-is-fine THIS_IS_FINE`

  set -x
  
  DESTINATION_MODEL=$1 # zeke/this-is-fine
  TRAINING_MODEL="stability-ai/sdxl:a00d0b7dcbb9c3fbb34ba87d2d5b46c56969c84a628bf778a7fdaec30b1b99c5"
  TOKEN_STRING=${3:-TOK} # Defaults to "TOK"

  # Zip images
  find . -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \) -exec zip images.zip {} +


  # Upload zip and get a URL
  RESPONSE=$(curl -s -X POST -H "Authorization: Token $REPLICATE_API_TOKEN" https://dreambooth-api-experimental.replicate.com/v1/upload/images.zip)
  curl -X PUT -H "Content-Type: application/zip" --upload-file images.zip "$(jq -r ".upload_url" <<< "$RESPONSE")"
  SERVING_URL=$(jq -r ".serving_url" <<< $RESPONSE)

  echo "DESTINATION_MODEL: $DESTINATION_MODEL"
  echo "TRAINING_MODEL: $TRAINING_MODEL"
  echo "SERVING_URL: $SERVING_URL"
  echo "TOKEN_STRING: $TOKEN_STRING"

  replicate train --destination $DESTINATION_MODEL $TRAINING_MODEL input_images="$SERVING_URL" token_string="TOKEN_STRING" 
}

center_images_on_white_squares() {
  # Ensure ImageMagick is installed
  if ! command -v convert &> /dev/null; then
      echo "ImageMagick is not installed. Please install it first."
      exit 1
  fi

  # Loop through all image files in the current directory
  for image in *.webp; do
      if [[ -f $image ]]; then
          # Create a new filename for the squared image
          filename=$(basename -- "$image")
          filename="${filename%.*}"
          new_image="${filename}_squared.jpg" # Changed the extension to jpg

          # Convert image to 512x512 square with padding on a white background
          convert "$image" -resize "400x400" -background white -gravity center -extent 512x512 "$new_image"

          echo "Processed $image -> $new_image"
      fi
  done

  echo "All images processed."
}

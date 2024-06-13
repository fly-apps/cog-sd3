# Run [Stable Diffusion 3 Medium](https://stability.ai/news/stable-diffusion-3-medium) as a Replicate Cog on Fly.io

## Deploy to Fly.io

> [!IMPORTANT]  
> Before you deploy, you'll need to get access to the model on Hugging Face by filling out the form in the model [repo](https://huggingface.co/stabilityai/stable-diffusion-3-medium-diffusers/tree/main).

```
fly launch --name [APP_NAME] --no-deploy

fly storage create

fly secrets set HUGGING_FACE_HUB_TOKEN=<HUGGING_FACE_TOKEN>

cog push registry.fly.io/[APP_NAME]:latest --use-cuda-base-image false

```
Now replace `image` in your fly.toml, then:
```
fly deploy
```

## Example Request

```curl
curl --silent --show-error https://[APP_NAME].fly.dev/predictions \
    --request POST \
    --header "Content-Type: application/json" \
    --data @- << 'EOF'
{
    "input": {
        "prompt": "a magical forest",
        "aspect_ratio": "3:2",
        "output_quality": 100
    }
}
EOF
```

Now view your image at `https://fly.storage.tigris.dev/[BUCKET_NAME]/[OUTPUT_IMAGE_NAME]`
<div align="center">
    <h1>SD3 Medium GPU Demo</h1>
    <p>Run <strong><a href="https://stability.ai/news/stable-diffusion-3-medium">Stable Diffusion 3 Medium</a></strong> as a Replicate Cog on Fly.io!</p>
</div>

![0614](https://github.com/fly-apps/cog-sd3/assets/3727384/c026fcf9-79a9-40eb-ae7c-6f1be6801b84)

Stable Diffusion 3 Medium is Stability AI's most advanced text-to-image open model yet. This demo exposes the model via a simple HTTP server, thanks to [Replicate Cog](https://github.com/replicate/cog). Cog is an open-source tool that lets you package machine learning models in a standard, production-ready container. When you're up and running, you can generate images using the `/predictions` endpoint. Images are automatically stored in object-storage on [Tigris](https://www.tigrisdata.com/) (you'll need to make sure you add a bucket to the app).

## Deploy to Fly.io

> [!IMPORTANT]  
> Before you deploy, you'll need to get access to the model on Hugging Face by filling out the form in the model [repo](https://huggingface.co/stabilityai/stable-diffusion-3-medium-diffusers/tree/main).

```sh
fly apps create --name [APP_NAME]

fly storage create

fly secrets set HUGGING_FACE_HUB_TOKEN=<HUGGING_FACE_TOKEN>

cog push registry.fly.io/[APP_NAME]:latest --use-cuda-base-image false

```
Now replace `image` in your fly.toml, then:

```sh
fly deploy
```

## Example Request

```sh
curl --silent https://[APP_NAME].fly.dev/predictions \
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

## How can I make the endpoint private?

## Having trouble?

Create an issue or ask a question here: https://community.fly.io/

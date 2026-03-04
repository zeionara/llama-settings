# Llama Settings

Configuration files for running LLMs in llama docker containers.

To run `TheBloke/Llama-2-13B-GGUF:Q4_K_M` on `arm` SoC, build a custom image for `linux/arm64` using [my llama.cpp fork][llama.cpp-fork]:

```sh
docker build -t local/llama.cpp:server --target server --build-arg TARGETARCH=arm64 -f .devops/cpu.Dockerfile .
```

An [original repo][llama.cpp] can be used though. Just delete mentions of `armv9` (see [this issue](https://github.com/ggml-org/llama.cpp/issues/13891)):

```sh
sed -i '/armv9/d' "ggml/src/CMakeLists.txt"
```

And update Dockerfile so that destination directories end with slash in `copy` commands.

When the image is ready, start the `TheBloke/Llama-2-13B-GGUF:Q4_K_M` model:

```sh
docker compose -f arm64-cpu-qwen3.5-2b/docker-compose.yml up
```

For asking the model a question, you can use the [provided script](/arm64-cpu-qwen3.5-2b/ask.sh):

```sh
./arm64-cpu-qwen3.5-2b/ask.sh
```

[llama.cpp]: https://github.com/ggml-org/llama.cpp
[llama.cpp-fork]: https://github.com/zeionara/llama.cpp

FROM ollama/ollama

ARG MODEL_LIST="gemma2:2b"

ENV OLLAMA_HOST=0.0.0.0:8000
ENV OLLAMA_KEEP_ALIVE=-1

RUN ollama serve & \
    sleep 5 && \
    for MODEL in $MODEL_LIST; do \
        echo "Pulling model: $MODEL"; \
        ollama pull "$MODEL"; \
    done

ENTRYPOINT ["ollama", "serve"]

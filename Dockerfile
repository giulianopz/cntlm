FROM debian:latest

RUN apt update && apt install -y --no-install-recommends git make gcc build-essential ca-certificates && \
    git clone https://github.com/giulianopz/cntlm.git && cd cntlm && \
    ./configure && make && strip cntlm && cp ./cntlm /usr/local/bin

EXPOSE 3128

ENTRYPOINT ["cntlm"]

CMD ["-h"]
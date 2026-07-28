FROM ghcr.io/mainland/cs360-haskell:ghc-9.10.3
ARG USERNAME=vscode
USER $USERNAME
COPY . /tmp
RUN cd /tmp && stack build --test --no-run-tests

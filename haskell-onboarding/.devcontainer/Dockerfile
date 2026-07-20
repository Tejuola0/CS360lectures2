FROM ghcr.io/mainland/cs360-haskell:ghc-9.10.3

ARG USERNAME=vscode

COPY --chown=$USERNAME:$USERNAME . /tmp/haskell-onboarding

USER $USERNAME

RUN cd /tmp/haskell-onboarding && stack build --test --no-run-tests

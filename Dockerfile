# Use a imagem base Debian leve
FROM debian:stable-slim

# Atualizar pacotes e instalar dependências
RUN apt-get update && \
    apt-get install -y \
    wget \
    gnupg2 \
    apt-transport-https \
    ca-certificates \
    --no-install-recommends

# Adicionar chaves do repositório
RUN wget -q https://downloads.plex.tv/plex-keys/PlexSign.key -O- | apt-key add -

# Adicionar repositório do Plex
RUN echo "deb https://downloads.plex.tv/repo/deb public main" | tee /etc/apt/sources.list.d/plex.list

# Instalar pacotes
RUN apt-get update && \
    apt-get install -y \
    qbittorrent-nox \
    radarr \
    sonarr \
    bazarr \
    plexmediaserver \
    --no-install-recommends

# Limpar o cache do apt
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expor portas
EXPOSE 8080/tcp 7878/tcp 8989/tcp 6767/tcp 32400/tcp

# Definir diretório de trabalho padrão
WORKDIR /config

# Executar os aplicativos
CMD ["bash"]

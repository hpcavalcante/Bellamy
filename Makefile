start:
	@sudo docker-compose up -d && \
	echo -e "\n\tEndereços localhost dos serviços:\n" && \
	echo -e "\tRadarr:       http://localhost:7878" && \
	echo -e "\tSonarr:       http://localhost:8989" && \
	echo -e "\tBazarr:       http://localhost:6767" && \
	echo -e "\tProwlarr:     http://localhost:9696\n"
create_nw:
	echo -e "\n\tCriando rede para os containers...\n"
	@sudo docker network create torrent_network

remove_nw:
	echo -e "\n\tRemovendo rede dos containers...\n"
	@sudo docker network rm torrent_network

remove:
	@sudo docker-compose down --rmi all --volumes --remove-orphans

restart:
	@sudo docker-compose restart

stop:
	@sudo docker-compose stop

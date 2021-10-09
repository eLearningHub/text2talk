start:
	docker run \
	-h text2talk \
	--detach \
	--name text2talk \
	--env COLORFGBG \
	--env EMAIL \
	--env GIT_AUTHOR_EMAIL \
	--env GIT_AUTHOR_NAME \
	--env GIT_COMMITTER_EMAIL \
	--env GIT_COMMITTER_NAME \
	--env SSH_AUTH_SOCK \
	--env TERM \
	--env USER=${USER} \
	--env GROUP=${USER} \
	--env USER_ID=`id -u ${USER}` \
	--env GROUP_ID=`getent group ${USER} | awk -F: '{printf $$3}'` \
	-v /dev:/dev \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $${PWD}:/home/${USER} \
	--env DISPLAY \
	--env VIDEO_GROUP_ID=`getent group video | awk -F: '{printf $$3}'` \
	-v /dev/dri:/dev/dri \
	-v /home/${USER}/.ssh:/home/${USER}/.ssh \
	-v /run/user/`id -u ${USER}`/keyring/ssh:/run/user/`id -u ${USER}`/keyring/ssh \
	-v /home/${USER}/.aws:/home/${USER}/.aws:ro \
	--cap-add=SYS_PTRACE \
	--net=host \
	--privileged \
	--add-host text2talk:127.0.0.1 \
	nubonetics/text2talk:latest
	xhost +local:'text2talk'

stop:
	@docker stop text2talk
	@docker rm text2talk

enter:
	@docker exec -it --env COLORFGBG --env TERM -u ${USER} --workdir /home/${USER} text2talk /bin/bash -li

FROM ubuntu:14.04
MAINTAINER Bogdan Mustiata <bogdan.mustiata@gmail.com>

ENV UID=1000
ENV GID=1000

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y vnc4server novnc websockify

RUN useradd -m raptor

RUN dpkg --add-architecture i386 \
        && apt-get update \
        && apt-get install -y --no-install-recommends \
                wine \
        && rm -rf /var/lib/apt/lists/*

CMD perl -pi -e "s/raptor:x:1000:1000/raptor:x:$UID:$GID/" /etc/passwd && \
    perl -pi -e "s/raptor:x:1000:/raptor:x:$GID:/" /etc/group

# here the installation of Heroes 3 Demo was done manually,
# using wine h3demo.exe, and just clicking install, without installing
# .NET or the Gecko browser for wine.

# also the data/wine_folder/drive_c/users/Public/Start\ Menu/Programs/3DO/
# was removed, since there seems to be a Docker bug with filenames that contain
# non ISO characters.

ADD data/wine_folder /home/raptor/.wine
EXPOSE 8081

RUN cp -R /usr/share/novnc /home/raptor/novnc
ADD bin/index.html /home/raptor/novnc/
ADD bin/xstartup /home/raptor/.vnc/xstartup
ADD bin/start-h3.sh /home/raptor/bin/start-h3.sh

RUN chown -R raptor:raptor /home/raptor/

USER raptor

CMD /home/raptor/bin/start-h3.sh


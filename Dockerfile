FROM archlinux:base-20230212.0.126025

ENV container docker

# Add support for the locale: German
RUN sed -i 's/\(!usr\/share\/i18n\/\)\(charmaps\/\)\(UTF-8.gz\)/\1\2\3 \1\2ISO-8859-1.gz \1\2ISO-8859-15.gz \1locales\/de_DE@euro/g' /etc/pacman.conf \
    && sed -i 's/\(!usr\/share\/\*locales\/\)\(en_??\)/\1\2 \1de_??/g' /etc/pacman.conf

# Install required packages
RUN pacman -Sy \
    && pacman -S --noconfirm \
        glibc \
        openssh \
        python \
        sudo \
        systemd \
    && pacman -Sc --noconfirm

# Remove not needed systemd targets
RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    && rm -f /etc/systemd/system/*wants/* \
    && rm -f /lib/systemd/system/local-fs.target.wants/* \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /lib/systemd/system/basic.target.wants/*

# Add volume needed by systemd
VOLUME [ "/sys/fs/cgroup" ]

# Add command
CMD ["/usr/lib/systemd/systemd"]

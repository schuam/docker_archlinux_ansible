FROM archlinux:latest

RUN pacman -Sy \
    && pacman -S --noconfirm \
        python \
        sudo \
    && pacman -Sc --noconfirm


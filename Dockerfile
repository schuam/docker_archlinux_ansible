FROM archlinux:latest

RUN sed -i 's/\(!usr\/share\/i18n\/\)\(charmaps\/\)\(UTF-8.gz\)/\1\2\3 \1\2ISO-8859-1.gz \1\2ISO-8859-15.gz \1locales\/de_DE@euro/g' /etc/pacman.conf \
    && sed -i 's/\(!usr\/share\/\*locales\/\)\(en_??\)/\1\2 \1de_??/g' /etc/pacman.conf \
    && pacman -Sy \
    && pacman -S --noconfirm \
        glibc \
        python \
        sudo \
    && pacman -Sc --noconfirm

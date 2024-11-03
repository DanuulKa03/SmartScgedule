# Базовый образ
FROM carlonluca/qt-dev:6.8.0

# Копирование текущей директории в /firmware внутри контейнера
COPY . /firmware
WORKDIR /firmware

# Установка необходимых пакетов и настройка Git
RUN git config --global --add safe.directory /firmware && \
    apt update && \
    apt -y install openssh-server rsync

# Настройка SSH-сервера
RUN mkdir /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    echo "export VISIBLE=now" >> /etc/profile && \
    useradd -ms /bin/bash tvgu && \
    echo 'tvgu:tvgu' | chpasswd

# Установка переменной окружения для видимости пользователя
ENV NOTVISIBLE "in users profile"

# Команда запуска SSH-сервера
CMD ["/usr/sbin/sshd", "-D"]

# Открытие портов 22 (для SSH) и 7777
EXPOSE 22 7777

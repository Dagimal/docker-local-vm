# Menggunakan image dasar Ubuntu
FROM cruizba/ubuntu-dind

# Memperbarui daftar paket dan menginstal OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/lib/apt/lists/*

# Membuat direktori untuk SSH
RUN mkdir /var/run/sshd

# Mengatur password untuk pengguna root (gantilah 'yourpassword' dengan password yang diinginkan)
RUN echo 'root:dagimal102938' | chpasswd

# Mengizinkan root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Mengekspos port SSH
EXPOSE 22

# Menjalankan SSH daemon saat kontainer dijalankan
CMD ["/usr/sbin/sshd", "-D"]

FROM binhex/arch-base:latest

# additional files
##################

# add supervisor conf file for app
ADD build/*.conf /etc/supervisor/conf.d/

# add scripts to install app
ADD build/root/*.sh /root/

# add systemd/timer files to install app
ADD build/system/* /usr/lib/systemd/system/

# get release tag name from build arg
ARG release_tag_name

# install app
#############
RUN pacman -S --needed base-devel git clang rust cmake --noconfirm


# make executable and run bash scripts to install app
RUN chmod +x /root/*.sh && \
	/bin/bash /root/install.sh "${release_tag_name}"

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/usr/local/bin/init.sh"]
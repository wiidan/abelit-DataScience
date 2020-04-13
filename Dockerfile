# --------------------------
# Docker file
# --------------------------
FROM python:3.6

MAINTAINER Abelit <ychenid@live.com>


# Set TimeZone
ENV TZ=Asia/Shanghai 
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install  Python and Flask requirement
COPY ./backend/requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip --timeout 600 -i http://pypi.mirrors.ustc.edu.cn/simple --trusted-host pypi.mirrors.ustc.edu.cn \
    && pip install --timeout 600 -i http://pypi.mirrors.ustc.edu.cn/simple --trusted-host pypi.mirrors.ustc.edu.cn -r /tmp/requirements.txt \
    && if [ ! -d "/data/webapp" ]; then mkdir -p /data/webapp; fi \
    && if [ ! -d "/etc/uwsgi" ]; then mkdir -p /etc/uwsgi; fi 
COPY ./backend/uwsgi.ini /etc/uwsgi/uwsgi.ini

WORKDIR /data/webapp

# ENV PORT 5000
EXPOSE 5000

CMD ["uwsgi",  "--ini", "/etc/uwsgi/uwsgi.ini"]
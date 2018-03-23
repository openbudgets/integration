FROM okgreece/opencpu-docker-obeu

#add host
COPY ./host.sh /host.sh
RUN sh /host.sh
#update the algorithms
COPY ./libraries.R /libraries.R
RUN R < libraries.R --no-save

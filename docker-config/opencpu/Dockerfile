FROM okgreece/opencpu-docker-obeu

#update the algorithms
COPY ./libraries.R /libraries.R
RUN R < libraries.R --no-save

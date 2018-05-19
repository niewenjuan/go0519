FROM 100.125.0.31:20202/hwcse/as-go:1.8.5

COPY ./githubgo121 /home
COPY ./conf /home/conf
RUN chmod +x /home/githubgo121

CMD ["/home/githubgo121"]
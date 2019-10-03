FROM mcr.microsoft.com/dotnet/core/runtime:3.0.0-buster-slim

# ODBC driver manager
RUN apt-get update \
    && apt-get install -y --no-install-recommends unixodbc-bin \
    && rm -rf /var/lib/apt/lists/*

# Vertica ODBC driver and configurations
RUN curl https://www.vertica.com/client_drivers/9.2.x/9.2.1-0/vertica-client-9.2.1-0.x86_64.tar.gz | tar xz opt/vertica/lib64/libverticaodbc.so opt/vertica/en-US/VerticaMessages.xml opt/vertica/en-US/ODBCMessages.xml

COPY odbcinst.ini /etc/
COPY vertica.ini /etc/

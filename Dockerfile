FROM almalinux:9
RUN dnf module disable nodejs -y
RUN dnf module enable nodejs:25 -y
RUN dnf install nodejs -y
WORKDIR /opt/backend
COPY package.json ./
COPY *.js ./
RUN npm install
ENV DB_HOST="mysql"
CMD ["node", "index.js"]
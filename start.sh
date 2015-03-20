#

# Create config
cp /default-template.conf /etc/nginx/conf.d/default.conf

sed -i "s/NEO4J_NODE1_HOST/$NEO4JN1_PORT_7474_TCP_ADDR:$NEO4JN1_PORT_7474_TCP_PORT/g" /etc/nginx/conf.d/default.conf
sed -i "s/NEO4J_HOSTNAME/$NEO4J_HOSTNAME/g" /etc/nginx/conf.d/default.conf

# Start nginx
nginx -g "daemon off;"
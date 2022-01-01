-- Create connections
INSERT INTO guacamole_connection (connection_name, protocol) VALUES ('SSH', 'ssh');
INSERT INTO guacamole_connection (connection_name, protocol) VALUES ('VNC', 'vnc');

-- Add parameters to the new connection
INSERT INTO guacamole_connection_parameter VALUES (1, 'hostname', 'desktop');
INSERT INTO guacamole_connection_parameter VALUES (1, 'port', '22');
INSERT INTO guacamole_connection_parameter VALUES (2, 'hostname', 'desktop');
INSERT INTO guacamole_connection_parameter VALUES (2, 'port', '5901');

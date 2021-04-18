-- Create connections
INSERT INTO guacamole_connection (connection_name, protocol) VALUES ('desktop-ssh', 'ssh');
INSERT INTO guacamole_connection (connection_name, protocol) VALUES ('desktop-vnc', 'vnc');

-- Add parameters to the new connection
INSERT INTO guacamole_connection_parameter VALUES (1, 'hostname', 'desktop');
INSERT INTO guacamole_connection_parameter VALUES (1, 'port', '22');
INSERT INTO guacamole_connection_parameter VALUES (2, 'hostname', 'desktop');
INSERT INTO guacamole_connection_parameter VALUES (2, 'port', '5900');

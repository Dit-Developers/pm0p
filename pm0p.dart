import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main(List<String> args) async {
  print('''
                     ____      
    ____  ____ ___  / __ \____ 
   / __ \/ __ `__ \/ / / / __ \
  / /_/ / / / / / / /_/ / /_/ /
 / .___/_/ /_/ /_/\____/ .___/ 
/_/                   /_/      
                https://msuport.vercel.app/
  ''');
  
  if (args.isEmpty) {
    print('Usage: dart scanner.dart <target>');
    exit(1);
  }
  
  String target = args[0];
  List<int> ports = await fetchPorts();
  print('Scanning $target for open ports...');
  
  List<Future<void>> scans = ports.map((port) => scanPort(target, port)).toList();
  await Future.wait(scans);
}

Future<List<int>> fetchPorts() async {
  List<int> ports = [];
  List<String> urls = [
    'https://github.com/maraisr/ports-list/raw/refs/heads/main/udp.csv',
    'https://github.com/maraisr/ports-list/raw/refs/heads/main/tcp.csv'
  ];

  for (var url in urls) {
    try {
      HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse(url));
      HttpClientResponse response = await request.close();
      String csvData = await response.transform(utf8.decoder).join();
      client.close();

      List<String> lines = csvData.split('\n');
      for (var line in lines.skip(1)) {
        List<String> parts = line.split(',');
        if (parts.isNotEmpty) {
          int? port = int.tryParse(parts[0]);
          if (port != null) ports.add(port);
        }
      }
    } catch (e) {
      print('Error fetching ports from $url: $e');
    }
  }
  return ports;
}

Future<void> scanPort(String host, int port) async {
  try {
    Socket socket = await Socket.connect(host, port, timeout: Duration(seconds: 2));
    print('[+] Open Port: $port');
    socket.destroy();
  } catch (e) {
    // Port is closed or unreachable
  }
}

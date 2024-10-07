import 'package:flutter/material.dart';
import 'package:navigasi/models/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [  
      Item(
        name: 'Mouse',
        price: 15000,
        imageUrl: 'https://image.popmama.com/content-images/community/20230606/community-e63f1ef196034bdc3f7d4ea41c3654af.JPG',
        stock: 15,
        rating: 4.9,
      ),
      Item(
        name: 'Keyboard',
        price: 200000,
        imageUrl: 'https://cdn.mos.cms.futurecdn.net/ky5SNRNR255FUbDuW6Ji4E-1200-80.jpg',
        stock: 20,
        rating: 5,
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Items List"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom
            childAspectRatio: 0.7, // Rasio lebar terhadap tinggi
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Hero(
                tag: item.name, // Tag yang unik untuk animasi Hero
                child: Card(
                  child: Column(
                    children: [
                      Expanded( // Menggunakan Expanded agar gambar mengambil ruang yang tepat
                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0), // Memberikan padding
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 4), // Jarak antara nama dan harga
                            Text('Rp ${item.price}', style: TextStyle(color: Colors.green)),
                            SizedBox(height: 4), // Jarak antara harga dan stok
                            Text('Stock: ${item.stock}'),
                            SizedBox(height: 4), // Jarak antara stok dan rating
                            Text('Rating: ${item.rating}', style: TextStyle(color: Colors.orange)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // Tambahkan footer jika perlu
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(16),
            child: Text('Nama: Dwi Ayu Setiawati, NIM:362358302073'),
            ),
        );
    }
}
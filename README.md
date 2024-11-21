## **Nama : Sukma Bagus Wahasdwika**

## **NIM  : 2241720223**

# **Pemrograman Asynchronous**

## **Praktikum 1 - Mengunduh Data dari Web Service (API)**

### **Soal 1: Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.**

![alt text](image.png)

### **Soal 2: Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.**

![alt text](image-1.png)

### **Soal 3:**
* Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!

    Kode tersebut memanfaatkan substring untuk membatasi tampilan data API dan menggunakan catchError untuk menangani kesalahan yang mung
* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3".

    ![alt text](image-2.png)

## **Praktikum 2 - Menggunakan await/async untuk menghindari callbacks**

### **Soal 4:**
* Jelaskan maksud kode langkah 1 dan 2 tersebut!

    Langkah 1: Membuat fungsi-fungsi yang mensimulasikan proses yang membutuhkan waktu, masing-masing mengembalikan nilai tertentu (1, 2, dan 3).
    Langkah 2: Membuat fungsi count() untuk menghitung total nilai dari ketiga fungsi asynchronous tersebut secara berurutan (total = 1 + 2 + 3 = 6).
    Hasil Akhir: Setelah proses selesai, UI akan diperbarui untuk menampilkan hasil total (6) setelah 9 detik (3 detik x 3 fungsi).

* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 4".

    ![alt text](gif/praktikum2.gif)


## **Praktikum  3 - Menggunakan Completer di Future**

### **Soal 5:**
* Jelaskan maksud kode langkah 2 tersebut!

    Panggilan getNumber() akan mengembalikan sebuah Future yang akan selesai dengan nilai 42 setelah 5 detik.
    Kode tersebut menggambarkan bagaimana menggunakan completer untuk mengontrol penyelesaian sebuah Future secara manual, terutama dalam situasi dimana kita memiliki logika kompleks atau perlu menyelesaikan Future di waktu yang tidak langsung.

* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 5".

    ![alt text](gif/praktikum3.gif)

## **Soal 6:**
* Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

    Langkah 2 menunjukkan versi dasar dari penggunaan Completer untuk menyelesaikan sebuah proses sederhana. Sementara itu, Langkah 5-6 menambahkan fleksibilitas dan keandalan dengan menangani error, memisahkan logika penghitungan, dan memberikan kontrol lebih besar terhadap bagaimana hasil ditampilkan di UI.

* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 6".

    ![alt text](gif/praktikum3.1.gif)


## **Praktikum  4 - Memanggil Future secara paralel**

## **Soal 7:**
* Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 7".

    ![alt text](gif/praktikum4.gif)

## **Soal 8:**
* Jelaskan maksud perbedaan kode langkah 1 dan 4!
    Langkah 1:
    - Bisa menambahkan future secara dinamis sebelum grup ditutup.	
    - Memerlukan lebih banyak kode dan pengelolaan eksplisit.
    - 	Cocok untuk situasi dengan kumpulan future yang tidak pasti sejak awal.
    - Harus memanggil close() secara manual sebelum hasil diproses.	

    Langkah 4:
    - Semua future harus diketahui dan didefinisikan sekaligus.
    - Lebih ringkas dan mudah diimplementasikan.
    - Cocok jika semua future sudah pasti sejak awal.
	- Tidak memerlukan langkah tambahan seperti close().
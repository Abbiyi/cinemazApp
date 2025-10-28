# 🎬 CINEMAZ  
### Flutter Movie Rating & Favorite App  


---

## 📱 Deskripsi Singkat  

**Cinemaz** adalah aplikasi mobile berbasis **Flutter** yang menampilkan daftar film lengkap dengan **judul, genre, rating, dan deskripsi singkat**.  
Aplikasi ini memiliki tampilan **modern, interaktif, dan responsif**, dengan fitur **Favorite** serta **Profile** untuk personalisasi pengguna.  

Data film disimpan secara **lokal dalam file JSON**, sehingga aplikasi dapat dijalankan **tanpa koneksi internet**.  
Proyek ini dikembangkan sebagai bagian dari tugas mata kuliah **Pemrograman Mobile** oleh mahasiswa **Teknik Informatika Semester 5**.

---

## 🎯 Tema dan Tujuan Aplikasi  

### 🎬 Tema  
> Aplikasi Katalog dan Rating Film  

### 🎯 Tujuan  
- Menampilkan daftar film secara menarik dan mudah diakses.  
- Memberikan pengalaman pengguna interaktif melalui fitur favorit dan profil.  
- Mengimplementasikan konsep **multi-page navigation** dan **pengolahan data JSON** di Flutter.  
- Meningkatkan keterampilan dalam membangun antarmuka pengguna (**UI/UX**) berbasis **Material Design**.

---

## 🧭 Daftar Halaman & Fungsinya  

| Halaman | Nama File | Fungsi Utama |
|----------|------------|--------------|
| 🏠 **Homepage** | `home_page.dart` | Menampilkan carousel genre dan daftar film populer. |
| 🎞️ **All Movies Page** | `all_movies_page.dart` | Menampilkan semua film dari file JSON dalam bentuk grid 2 kolom. |
| ❤️ **Favorite Page** | `favorite_page.dart` | Menampilkan daftar film yang ditandai sebagai favorit oleh pengguna. |
| 📖 **Detail Page** | `detail_page.dart` | Menampilkan detail lengkap film (poster, deskripsi, rating, dan tombol love). |
| 👤 **Profile Page** | `profile_page.dart` | Menampilkan dan mengedit nama serta bio pengguna. |

---

## 🧩 Struktur Folder Proyek  

lib/

│

├── main.dart

├── theme/

│ └── app_theme.dart

├── models/

│ └── movie_model.dart

├── pages/

│ ├── home_page.dart

│ ├── all_movies_page.dart

│ ├── favorite_page.dart

│ ├── detail_page.dart

│ └── profile_page.dart

├── widgets/

│ └── movie_card.dart

├── data/

│ └── movies.json


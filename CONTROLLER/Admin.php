<?php
require_once 'C:/xampp/htdocs/backend/model/user.php';
require_once 'C:/xampp/htdocs/backend/model/buku.php';
require_once 'C:/xampp/htdocs/backend/model/kategori_buku.php';
require_once 'C:/xampp/htdocs/backend/model/kategori_buku_relasi.php';
require_once 'C:/xampp/htdocs/backend/model/ulasan_buku.php';
require_once 'C:/xampp/htdocs/backend/model/koleksi.php';
require_once 'C:/xampp/htdocs/backend/model/peminjaman.php';
require_once 'C:/xampp/htdocs/backend/model/masukan.php';


class Admin
{
    public function __construct()
    {
    }
    /////////////done///////////////////
    public function TambahBuku($nama_kategori, $gambar_tmp, $ext, $judul, $penulis, $penerbit, $tahun, $sinopsis, $bahasa, $jumlah_halaman)
    {
        $nama_gambar = strtolower(str_replace(' ', '_', $judul));
        $kode_unik = uniqid();
        $gambar_nama = $nama_gambar . '_' . $kode_unik . '.' . $ext;
        $gambar_destinasi = "C:/xampp/htdocs/backend/assets/gambar/" . $gambar_nama;

        $buku = new Buku(null, $judul, $penulis, $penerbit, $sinopsis, $tahun, $gambar_nama, $bahasa, $jumlah_halaman);

        try {
            // Eksekusi query untuk menambahkan buku
            $upload = $buku->TambahBuku();
            if ($upload == true) {
                move_uploaded_file($gambar_tmp, $gambar_destinasi);

                $kategori_id = new KategoriBuku(null, $nama_kategori);
                $idkategori = $kategori_id->TampilIdKategori();
                $idbuku = $buku->TampilId();

                if ($idbuku == true) {
                    $kategori_relasi = new KategoriBukuRelasi(null, $idbuku, $idkategori);
                    $kategori_relasi->simpanRelasi();
                    if ($kategori_relasi == true) {
                        $_SESSION['message'] = "Berhasil";
                    } else {
                        $_SESSION['message'] = "Gagal";
                    }
                } else {
                    $_SESSION['message'] = "Gagal";
                }
            } else {
                $_SESSION['message'] = "Gagal";
            }
        } catch (mysqli_sql_exception $e) {
            // Tangkap pesan error dan simpan ke dalam session message
            $_SESSION['message'] = "Gagal menambahkan buku: " . $e->getMessage();
        }
    }

    public function TampilBuku()
    {
        $buku = new Buku(null, null, null, null, null, null, null, null, null);
        return $buku->TampilBuku();
    }
    public function TampilBukuWhereId($buku_id)
    {
        $buku = new Buku($buku_id, null, null, null, null, null, null, null, null);
        return $buku->getAllBookWhereId();
    }

    public function TampilUlasan($buku_id)
    {
        $ulasan = new UlasanBuku(null, null, $buku_id, null, null);
        return $ulasan->TampilUlasan();
    }

    public function TampilKategori()
    {
        $kategori = new KategoriBuku(null, null);
        return  $kategori->TampilkanKategori();
    }

    public function HapusBuku($buku_id)
    {
        $pinjaman = new Peminjaman(null, null, $buku_id, null, null, null);
        $hapus_pinjaman = $pinjaman->AdminHapusPinjaman();


        if ($hapus_pinjaman == true) {
            $koleksi = new Koleksi(null, null, $buku_id);
            $hapus_koleksi = $koleksi->AdminHapusKoleksi();

            if ($hapus_koleksi == true) {
                $ulasan = new UlasanBuku(null, null, $buku_id, null, null);
                $hapus_ulasan = $ulasan->AdminHapusUlasan();
                if ($hapus_ulasan == true) {
                    $relasi = new KategoriBukuRelasi(null, $buku_id, null);
                    $hapus_relasi = $relasi->HapusRelasi();
                    if ($hapus_relasi == true) {
                        $buku = new Buku($buku_id, null, null, null, null, null, null, null, null);
                        $hapus_buku = $buku->HapusBuku();
                        if ($hapus_buku == true) {
                            $_SESSION['message'] = "Berhasil";
                        } else {
                            $_SESSION['message'] = "Gagal";
                        }
                    } else {
                        $_SESSION['message'] = "Gagal";
                    }
                } else {
                    $_SESSION['message'] = "Gagal";
                }
            } else {
                $_SESSION['message'] = "Gagal";
            }
        } else {
            $_SESSION['message'] = "Gagal";
        }
    }

    public function EditBuku($buku_id, $judul, $penulis, $penerbit, $tahun, $sinopsis, $nama_kategori, $bahasa, $jumlah_halaman, $gambar)
    {
        $buku = new Buku($buku_id, $judul, $penulis, $penerbit, $sinopsis, $tahun, $gambar, $bahasa, $jumlah_halaman);
        $edit_buku = $buku->EditBuku();
        if ($edit_buku) {
            $kategori = new KategoriBuku(null, $nama_kategori);
            $kategori_id = $kategori->TampilIdKategori();
            if ($kategori_id !== null) {
                $edit_relasi = new KategoriBukuRelasi(null, $buku_id, $kategori_id);
                $relasi_baru = $edit_relasi->EditRelasi();
                if ($relasi_baru) {
                } else {
                }
            } else {
                $_SESSION['message'] = 'Berhasil';
            }
        } else {
            $_SESSION['message'] = 'Gagal';
        }
    }



    public function TambahKategori($nama_kategori)
    {
        $kategori = new KategoriBuku(null, $nama_kategori);
        $tambah_ketegori = $kategori->TambahKategori();

        if ($tambah_ketegori == true) {
            $_SESSION['message'] = "Berhasil";
        } else {
            $_SESSION['message'] = 'Gagal';
        }
    }


    public function JumlahPengguna()
    {
        $pengguna = new User(null, null, null, null, null, null, null);
        return $pengguna->HitungJumlahPengguna();
    }
    public function JumlahBuku()
    {
        $buku = new Buku(null, null, null, null, null, null, null, null, null);
        return $buku->HitungJumlahBuku();
    }
    public function JumlahKategori()
    {
        $kategori = new KategoriBuku(null, null);
        return $kategori->HitungJumlahKategori();
    }
    public function JumlahPeminjaman()
    {
        $peminjaman = new Peminjaman(null, null, null, null, null, null);
        return $peminjaman->HitungJumlahPeminjaman();
    }
    public function JumlahUlasan()
    {
        $ulasan = new UlasanBuku(null, null, null, null, null);
        return $ulasan->HitungJumlahUlasan();
    }

    public function TampilPengguna()
    {
        $pengguna = new User(null, null, null, null, null, null, null);
        return $pengguna->TampilSemuaDataUser();
    }
    public function TampilMasukan()
    {
        $masukan = new Masukan(null, null, null, null);
        return $masukan->TampilMasukan();
    }
    public function TampilPinjaman()
    {
        $pinjaman = new buku(null, null, null, null, null, null, null, null, null);
        return $pinjaman->AdminTampilPinjaman();
    }

    public function UpdateStatusPinjaman($id_pinjaman)
    {
        $pinjaman = new Peminjaman($id_pinjaman, null, null, null, null, null);
        $updateStatus = $pinjaman->AdminUpdateStatus();

        if ($updateStatus == true) {
            $_SESSION['message'] = "Berhasil";
        } else {
            $_SESSION['message'] = "Gagal";
        }

        return $updateStatus;
    }

    public function TampilNamaKategoriWhereId($id_kategori)
    {
        $kategori = new KategoriBuku($id_kategori, null);
        return $kategori->TampilNamaKategoriWhereId();
    }
    public function EditKategori($id_kategori, $nama_baru)
    {
        $kategori = new KategoriBuku($id_kategori, $nama_baru);
        $kategori->EditKategori();
        if ($kategori == true) {
            $_SESSION['message'] = "Berhasil";
        } else {
            $_SESSION['message'] = "Gagal";
        }
    }

    public function TampilBukuEdit($buku_id)
    {
        $buku = new buku($buku_id, null, null, null, null, null, null, null, null);
        return $buku->AdminTampilBuku();
    }

    public function BukuPalingBanyakDipinjam()
    {
        $buku = new buku(null, null, null, null, null, null, null, null, null);
        return $buku->BukuPalingBanyakDipinjam();
    }
    public function DaftarBuku()
    {
        $buku = new buku(null, null, null, null, null, null, null, null, null);
        return $buku->DaftarBukuLaporan();
    }
    public function DaftarKategori()
    {
        $kategori = new KategoriBuku(null, null);
        return $kategori->DaftarKategoriLaporan();
    }
    public function UserPalingBanyakMeminjam()
    {
        $user = new User(null, null, null, null, null, null, null);
        return $user->UserPalingBanyakMeminjam();
    }
    public function KategoriPalingBanyakDipinjam()
    {
        $kategori = new KategoriBuku(null, null);
        return $kategori->KategoriPalingBanyakDipinjam();
    }
    public function LaporanPeminjaman()
    {
        $peminjaman = new peminjaman(null, null, null, null, null, null);
        return $peminjaman->LaporanPeminjaman();
    }
}

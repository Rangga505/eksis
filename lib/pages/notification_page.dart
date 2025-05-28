import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import '../widgets/common_navbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Sample notification data
  final List<NotificationItem> _notifications = [
    NotificationItem(
      title: 'Pendaftaran Basket',
      message: 'Selamat! Anda telah berhasil mendaftar ekstrakurikuler Basket.',
      time: DateTime.now().subtract(const Duration(minutes: 30)),
      icon: Icons.sports_basketball,
      color: Colors.orange,
      isRead: false,
    ),
    NotificationItem(
      title: 'Jadwal Latihan',
      message: 'Jadwal latihan Pramuka telah diperbarui. Silakan periksa halaman detail.',
      time: DateTime.now().subtract(const Duration(hours: 2)),
      icon: Icons.flare,
      color: Colors.green,
      isRead: false,
    ),
    NotificationItem(
      title: 'Pengumuman Penting',
      message: 'Semua kegiatan ekstrakurikuler akan diliburkan pada tanggal 17 Mei 2025 karena renovasi gedung sekolah.',
      time: DateTime.now().subtract(const Duration(hours: 5)),
      icon: Icons.announcement,
      color: Colors.red,
      isRead: true,
    ),
    NotificationItem(
      title: 'Prestasi Baru',
      message: 'Tim Voli sekolah kita meraih Juara 1 dalam kompetisi tingkat kabupaten!',
      time: DateTime.now().subtract(const Duration(days: 1)),
      icon: Icons.emoji_events,
      color: Colors.amber,
      isRead: true,
    ),
    NotificationItem(
      title: 'Undangan Rapat',
      message: 'Anda diundang untuk menghadiri rapat koordinasi ketua ekstrakurikuler pada hari Kamis, 15 Mei 2025.',
      time: DateTime.now().subtract(const Duration(days: 2)),
      icon: Icons.people,
      color: Colors.blue,
      isRead: true,
    ),
    NotificationItem(
      title: 'Pembayaran Iuran',
      message: 'Iuran bulanan untuk ekstrakurikuler Basket telah berhasil dibayarkan.',
      time: DateTime.now().subtract(const Duration(days: 3)),
      icon: Icons.payment,
      color: Colors.purple,
      isRead: true,
    ),
    NotificationItem(
      title: 'Dokumentasi Kegiatan',
      message: 'Foto-foto kegiatan Pramuka telah diunggah. Lihat di galeri sekarang!',
      time: DateTime.now().subtract(const Duration(days: 4)),
      icon: Icons.photo_library,
      color: Colors.teal,
      isRead: true,
    ),
  ];

  // Toggle to show all or unread notifications only
  bool _showOnlyUnread = false;

  @override
  Widget build(BuildContext context) {
    // Filter notifications based on toggle
    final List<NotificationItem> filteredNotifications = _showOnlyUnread
        ? _notifications.where((notification) => !notification.isRead).toList()
        : _notifications;

    return Scaffold(
      backgroundColor: const Color(0xFF2C3A47), // Match home page background
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Use CommonHeader widget
            const CommonHeader(),
            
            // Main content
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F6FA), // Light gray background
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Column(
                    children: [
                      // Notification header with filter and mark all read options
                      _buildNotificationHeader(),
                      
                      // List of notifications
                      Expanded(
                        child: filteredNotifications.isEmpty
                            ? _buildEmptyState()
                            : _buildNotificationList(filteredNotifications),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const CommonNavBar(currentIndex: 2), // Assuming notification is at index 1
    );
  }

  Widget _buildNotificationHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notifikasi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3A47),
                ),
              ),
              Row(
                children: [
                  // Toggle for unread notifications
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showOnlyUnread = !_showOnlyUnread;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _showOnlyUnread
                            ? const Color(0xFF2C3A47)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.mark_email_unread,
                            size: 16,
                            color: _showOnlyUnread ? Colors.white : Colors.grey.shade700,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Belum Dibaca',
                            style: TextStyle(
                              fontSize: 12,
                              color: _showOnlyUnread ? Colors.white : Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Mark all as read button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        for (var notification in _notifications) {
                          notification.isRead = true;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.done_all,
                        size: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Lihat semua update dan info terbaru tentang kegiatan ekstrakurikuler.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 10),
          Divider(color: Colors.grey.shade300, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildNotificationList(List<NotificationItem> notifications) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: notifications.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.shade200,
        height: 1,
      ),
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationItem(notification);
      },
    );
  }

  Widget _buildNotificationItem(NotificationItem notification) {
    return GestureDetector(
      onTap: () {
        setState(() {
          notification.isRead = true;
        });
        
        // Show notification details in bottom sheet
        _showNotificationDetails(notification);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: notification.isRead ? Colors.transparent : Colors.blue.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon with notification type
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: notification.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                notification.icon,
                color: notification.color,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            // Notification content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: notification.isRead ? FontWeight.w500 : FontWeight.bold,
                            color: const Color(0xFF2C3A47),
                          ),
                        ),
                      ),
                      if (!notification.isRead)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.message,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _formatTime(notification.time),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNotificationDetails(NotificationItem notification) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle at top
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Header with icon
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: notification.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      notification.icon,
                      size: 28,
                      color: notification.color,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      notification.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3A47),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Time
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _formatDetailedTime(notification.time),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Divider
              Divider(color: Colors.grey.shade300, thickness: 1),
              const SizedBox(height: 20),
              // Message content
              Text(
                notification.message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2C3A47),
                  height: 1.5,
                ),
              ),
              const Spacer(),
              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.grey.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Tutup'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle action based on notification type
                        Navigator.pop(context);
                        // Additional navigation would go here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: notification.color,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Lihat Detail'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_off,
              size: 50,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Tidak ada notifikasi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _showOnlyUnread
                ? 'Semua notifikasi telah dibaca'
                : 'Anda belum memiliki notifikasi',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 20),
          if (_showOnlyUnread)
            TextButton(
              onPressed: () {
                setState(() {
                  _showOnlyUnread = false;
                });
              },
              child: Text(
                'Tampilkan Semua',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} menit yang lalu';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} hari yang lalu';
    } else {
      return '${time.day}/${time.month}/${time.year}';
    }
  }

  String _formatDetailedTime(DateTime time) {
    final months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    
    return '${time.day} ${months[time.month - 1]} ${time.year}, ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class NotificationItem {
  final String title;
  final String message;
  final DateTime time;
  final IconData icon;
  final Color color;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
    required this.isRead,
  });
}
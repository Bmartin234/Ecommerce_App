import '../models/notification_type.dart';

class NotificationRepository {
  List<NotificationItem> getNotifications() {
    return const[
      NotificationItem(
        title: 'Order Confirmed',
        message:
        'Your order #12345 has been confirmed and is beign processed.',
        time: '2 minutes ago',
        type: NotificationType.order,
        isRead: true,
      ),
      NotificationItem(
        title: 'Special Offer!',
        message:
        'Get 20% off on all shoes this weekend',
        time: '1 hour ago',
        type: NotificationType.promo,
        isRead: true,
      ),
      NotificationItem(
        title: 'Out of Delivery',
        message:
        'Your order #12345 is out of delivery.',
        time: '3 hours ago',
        type: NotificationType.delivery,
        isRead: true,
      ),
      NotificationItem(
        title: 'payment Successful',
        message:
        'Your order #12345 has been confirmed and is beign processed.',
        time: '3 hours ago',
        type: NotificationType.payment,
        isRead: true,
      ),
    ];
  }
}
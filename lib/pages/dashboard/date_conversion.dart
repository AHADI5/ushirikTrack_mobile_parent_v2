import 'package:intl/intl.dart';

// Function to convert the published date to a relative time string
String relativeTime(String publishedDate) {
  // Parse the published date string into a DateTime object
  DateTime dateTime = DateTime.parse(publishedDate);

  // Get the current time
  DateTime now = DateTime.now();

  // Calculate the time difference
  Duration difference = now.difference(dateTime);

  // Convert the difference to minutes
  int differenceInMinutes = difference.inMinutes;

  // Define the time units
  const List<String> units = ['minute', 'hour', 'day'];

  // Define the plural suffixes for the time units
  const List<String> suffixes = ['s', '', 's'];

  // Define the time thresholds
  const List<int> thresholds = [60, 24, 30]; // in minutes

  // Loop through the time units and find the appropriate unit
  for (int i = 0; i < thresholds.length; i++) {
    if (differenceInMinutes < thresholds[i]) {
      return '${differenceInMinutes} ${units[i]}${differenceInMinutes != 1 ? suffixes[i] : ''} ago';
    }
    differenceInMinutes ~/= thresholds[i];
  }

  // If the difference is more than 30 days, display the date in a different format
  return DateFormat.yMMMMd().format(dateTime);
}

// void main() {
//   String publishedDate = "2024-04-07T00:04:42.317+00:00";
//   print(relativeTime(publishedDate));
// }

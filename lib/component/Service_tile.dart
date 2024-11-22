import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  final String taskName;
  final String imagepath;

  const ServiceTile({
    super.key,
    required this.taskName,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    print(imagepath);
    return Container(
      padding: const EdgeInsets.all(12.0),
      width: 1200,
      height: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 254, 172, 255),
        border: Border.all(
          color: Colors.teal,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.teal, // Image border color
                width: 3.0,
              ),
              borderRadius:
                  BorderRadius.circular(12.0), // Match image corner radius
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagepath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Task Name
          Expanded(
            child: Text(
              taskName,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

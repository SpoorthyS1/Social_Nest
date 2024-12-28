# Keep public classes, fields, and methods
-keep public class * {
    public *;
}

# Keep Firebase classes
-keep class com.google.firebase.** { *; }

# Keep Flutter classes
-keep class io.flutter.** { *; }

# Keep Kotlin classes
-keepclassmembers class kotlin.** {
    *;
}

# Keep Google Maps SDK classes
-keep public class com.google.android.gms.maps.** { *; }
-keep public class com.google.maps.android.** { *; }

# Keep Retrofit/OkHttp classes (if used)
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.squareup.** { *; }
-dontwarn okhttp3.**
-dontwarn retrofit2.**

# Suppress Flogger logs (optional)
-assumenosideeffects class com.google.common.flogger.backend.system.** { *; }

# Add any other library-specific or custom rules as needed

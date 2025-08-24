# Keep Plaid SDK classes
-keep class com.plaid.** { *; }
-keep class kotlinx.coroutines.** { *; }
-keep class mb.** { *; }
-keep class com.plaid.link.** { *; }

# Keep classes used by Plaid's reflection
-keepclassmembers class * {
    @com.plaid.link.** *;
}

# Kotlin metadata - Plaid SDK is written in Kotlin
-keep class kotlin.Metadata { *; }

# Avoid warnings from Plaid's internal APIs
-dontwarn com.plaid.**



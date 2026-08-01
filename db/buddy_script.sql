-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for buddy_script
CREATE DATABASE IF NOT EXISTS `buddy_script` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `buddy_script`;

-- Dumping structure for table buddy_script.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.cache: ~0 rows (approximately)

-- Dumping structure for table buddy_script.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.cache_locks: ~0 rows (approximately)

-- Dumping structure for table buddy_script.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_parent_id_foreign` (`parent_id`),
  CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.comments: ~11 rows (approximately)
INSERT INTO `comments` (`id`, `post_id`, `user_id`, `parent_id`, `body`, `created_at`, `updated_at`) VALUES
	(1, 2, 2, NULL, 'Updated comment', '2026-07-13 02:58:21', '2026-07-13 02:59:20'),
	(2, 2, 2, 1, 'Reply', '2026-07-13 02:58:49', '2026-07-13 02:58:49'),
	(3, 2, 3, 1, 'Another reply', '2026-07-13 15:07:24', '2026-07-13 15:07:24'),
	(9, 6, 4, NULL, 'Nice post', '2026-07-14 09:47:42', '2026-07-14 09:47:42'),
	(10, 2, 3, NULL, 'Posting another comment', '2026-07-14 10:27:13', '2026-07-14 10:27:13'),
	(11, 6, 4, 9, 'Replying', '2026-07-14 14:40:55', '2026-07-14 14:40:55'),
	(12, 6, 4, 11, 'Replying again', '2026-07-14 14:41:08', '2026-07-14 14:41:08'),
	(13, 6, 4, NULL, 'Another comment', '2026-07-14 14:42:25', '2026-07-14 14:42:25'),
	(17, 9, 7, NULL, 'A comment by alice', '2026-07-14 22:22:26', '2026-07-14 22:22:26'),
	(18, 9, 7, 17, 'A reply by alice', '2026-07-14 22:22:41', '2026-07-14 22:22:41'),
	(19, 9, 7, 18, 'Another reply', '2026-07-14 22:22:54', '2026-07-14 22:22:54'),
	(20, 9, 9, NULL, 'A new comment by Dan', '2026-07-14 22:33:17', '2026-07-14 22:33:17'),
	(21, 9, 9, 18, 'A reply by dan', '2026-07-14 22:33:41', '2026-07-14 22:33:41');

-- Dumping structure for table buddy_script.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table buddy_script.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.jobs: ~0 rows (approximately)

-- Dumping structure for table buddy_script.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.job_batches: ~0 rows (approximately)

-- Dumping structure for table buddy_script.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `likeable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likeable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `likes_user_id_likeable_id_likeable_type_unique` (`user_id`,`likeable_id`,`likeable_type`),
  KEY `likes_likeable_type_likeable_id_index` (`likeable_type`,`likeable_id`),
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.likes: ~16 rows (approximately)
INSERT INTO `likes` (`id`, `user_id`, `likeable_type`, `likeable_id`, `created_at`, `updated_at`) VALUES
	(2, 2, 'App\\Models\\Comment', 1, '2026-07-13 03:13:16', '2026-07-13 03:13:16'),
	(9, 3, 'App\\Models\\Comment', 5, '2026-07-13 15:14:01', '2026-07-13 15:14:01'),
	(10, 3, 'App\\Models\\Post', 5, '2026-07-14 03:36:33', '2026-07-14 03:36:33'),
	(14, 5, 'App\\Models\\Post', 6, '2026-07-14 08:14:28', '2026-07-14 08:14:28'),
	(15, 5, 'App\\Models\\Comment', 1, '2026-07-14 08:25:56', '2026-07-14 08:25:56'),
	(22, 3, 'App\\Models\\Post', 2, '2026-07-14 11:31:33', '2026-07-14 11:31:33'),
	(26, 3, 'App\\Models\\Comment', 10, '2026-07-14 11:52:44', '2026-07-14 11:52:44'),
	(30, 4, 'App\\Models\\Post', 7, '2026-07-14 14:36:51', '2026-07-14 14:36:51'),
	(31, 4, 'App\\Models\\Comment', 11, '2026-07-14 14:41:11', '2026-07-14 14:41:11'),
	(32, 4, 'App\\Models\\Post', 6, '2026-07-14 14:41:41', '2026-07-14 14:41:41'),
	(33, 4, 'App\\Models\\Comment', 13, '2026-07-14 14:43:46', '2026-07-14 14:43:46'),
	(34, 6, 'App\\Models\\Post', 8, '2026-07-14 22:10:34', '2026-07-14 22:10:34'),
	(35, 6, 'App\\Models\\Comment', 14, '2026-07-14 22:10:59', '2026-07-14 22:10:59'),
	(37, 7, 'App\\Models\\Post', 9, '2026-07-14 22:22:09', '2026-07-14 22:22:09'),
	(38, 7, 'App\\Models\\Comment', 18, '2026-07-14 22:22:56', '2026-07-14 22:22:56'),
	(39, 7, 'App\\Models\\Comment', 19, '2026-07-14 22:22:58', '2026-07-14 22:22:58'),
	(41, 9, 'App\\Models\\Post', 9, '2026-07-14 22:32:57', '2026-07-14 22:32:57'),
	(42, 9, 'App\\Models\\Comment', 18, '2026-07-14 22:33:50', '2026-07-14 22:33:50');

-- Dumping structure for table buddy_script.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.migrations: ~4 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_07_11_194157_create_personal_access_tokens_table', 2),
	(5, '2026_07_12_150511_create_posts_table', 3),
	(6, '2026_07_12_150518_create_comments_table', 3),
	(7, '2026_07_12_150525_create_likes_table', 3);

-- Dumping structure for table buddy_script.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table buddy_script.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.personal_access_tokens: ~10 rows (approximately)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 1, 'auth_token', '0107041a6e3c0c8d4b1f0006a9c6d82d1d0fc3815fb11a5aafa8d7aaa60618de', '["*"]', NULL, NULL, '2026-07-12 14:20:03', '2026-07-12 14:20:03'),
	(2, 'App\\Models\\User', 2, 'auth_token', '4525b21b79d4595437156eb8291e518a7721d6eb1293d6e01b345dc3f290312c', '["*"]', NULL, NULL, '2026-07-12 14:54:20', '2026-07-12 14:54:20'),
	(4, 'App\\Models\\User', 2, 'auth_token', 'be36c184427a31930bdf41a8b8e3670faa19a6b66a01361cf3a6a8646a3bd58b', '["*"]', '2026-07-13 03:13:16', NULL, '2026-07-13 02:22:35', '2026-07-13 03:13:16'),
	(6, 'App\\Models\\User', 3, 'auth_token', '3fa8bc0ae4c2e656fe41f35e7b7cc655c68c7844b9bfc39732d357ac6a29b9e1', '["*"]', NULL, NULL, '2026-07-14 03:57:20', '2026-07-14 03:57:20'),
	(7, 'App\\Models\\User', 4, 'auth_token', 'ad0cd15e90676b829575d4e332d3f0564c80abdfd1988f163d9753fce8481dc9', '["*"]', NULL, NULL, '2026-07-14 04:05:58', '2026-07-14 04:05:58'),
	(8, 'App\\Models\\User', 4, 'auth_token', '7e2f86f30d8e506024d8a1be84e3531d0708c455cffd36a5581024aa4b2ba345', '["*"]', NULL, NULL, '2026-07-14 04:14:57', '2026-07-14 04:14:57'),
	(9, 'App\\Models\\User', 4, 'auth_token', '811f866e9588468fc6dad273cd628f47443a4f9477a348c36d3888aa6bcaa5d1', '["*"]', NULL, NULL, '2026-07-14 08:08:36', '2026-07-14 08:08:36'),
	(10, 'App\\Models\\User', 4, 'auth_token', '3273e5b2807aa9a5faefa37839c64a4e7cc13352ff1cf4dac2733636fbe02b5a', '["*"]', NULL, NULL, '2026-07-14 08:08:41', '2026-07-14 08:08:41'),
	(11, 'App\\Models\\User', 4, 'auth_token', '32c430a667e758e17d6be55008dc5e6642497c0c10ea7188944d885d905d7c0e', '["*"]', NULL, NULL, '2026-07-14 08:09:08', '2026-07-14 08:09:08'),
	(15, 'App\\Models\\User', 4, 'auth_token', 'd16f73a73851e000dd8122c4af0df44e327eaf1b1811feb5bc833e8e2ac70934', '["*"]', '2026-07-14 10:17:14', NULL, '2026-07-14 08:49:13', '2026-07-14 10:17:14'),
	(27, 'App\\Models\\User', 4, 'auth_token', '19b8a1b67b02a36935c3a5265c4415d4e1d60a520745627f8fbad17a90609a88', '["*"]', '2026-07-14 22:37:43', NULL, '2026-07-14 22:37:42', '2026-07-14 22:37:43');

-- Dumping structure for table buddy_script.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` enum('public','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_visibility_index` (`visibility`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.posts: ~5 rows (approximately)
INSERT INTO `posts` (`id`, `user_id`, `body`, `image`, `visibility`, `created_at`, `updated_at`) VALUES
	(2, 2, 'This is my first post', NULL, 'public', '2026-07-13 02:55:53', '2026-07-13 02:55:53'),
	(4, 3, 'New Post', 'posts/Tl9rFHM9qucDdNtqOTmrAGnkzofJO0BaczBhRCKY.png', 'public', '2026-07-13 15:14:41', '2026-07-13 15:14:41'),
	(6, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nDonec pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu. In hendrerit gravida rutrum quisque non tellus orci ac. Diam sit amet nisl suscipit adipiscing bibendum est ultricies integer. Id nibh tortor id aliquet lectus proin nibh nisl condimentum. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus a. Pretium nibh ipsum consequat nisl vel pretium lectus. Habitasse platea dictumst quisque sagittis purus sit. Semper quis lectus nulla at volutpat diam ut venenatis tellus.\r\n\r\nOrci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt. Elementum nibh tellus molestie nunc non blandit massa enim. Volutpat ac tincidunt vitae semper quis lectus nulla. Amet tellus cras adipiscing enim eu turpis egestas pretium. Felis eget velit aliquet sagittis id consectetur purus ut. Dictum non consectetur a erat.', 'posts/M6C3eskcFxBw2gZJE56hL7NsjD6ZR7Ok2o5o3MZz.png', 'public', '2026-07-14 03:36:48', '2026-07-14 13:15:49'),
	(7, 4, 'New Post', 'posts/PUFDbZJyFR3XFfzemVNqb4BFymZbzuaxryCkGIhh.png', 'public', '2026-07-14 14:01:17', '2026-07-14 14:01:17'),
	(9, 7, 'A new Post by Alice', 'posts/R9ZNnBUBdIngeBGmGEuUrNfp7lnwyIMk4FyTyHn2.png', 'public', '2026-07-14 22:21:40', '2026-07-14 22:21:40');

-- Dumping structure for table buddy_script.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.sessions: ~4 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('0CN3M4xfmrUmodmKIpp06Z4GTHJo3Tui79mXN1C8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR2RrZ0NEb0Nuek5WUEgwQWN6SlJnRGhWMkQ0ZHZ3MUJZUXV3RE5YZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783964574),
	('0Vq04paTTWIYTClGhCNhG1LvOar3dWLbZMF7ryVf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzdYdnprWDA1TXBHUHhXWTJtTjNncGxYR2V3RkdPTUVKOFY3Qk0yViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783799351),
	('waBjQKEMwYLcTjakvrmTF90fjfLXtIpOIIQaBF22', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHBvUE9ER01pcGJMZnVyVndpeXVmVHBiRlpLb3FId1NFUmJSQ05RWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly9idWRkeXNjcmlwdC50ZXN0IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783784521),
	('WLWYqir1PJ0uXETo21XMgWwRTgLJZzlr6GPPsUSz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmZCTnBBbENtZU5DZ1JmQ2kxNHY1ZWN5c1FxVDJsU04wVExNVXBTZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly9idWRkeXNjcmlwdC50ZXN0IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783799347);

-- Dumping structure for table buddy_script.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table buddy_script.users: ~8 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(2, 'Tasin', 'tasin@example.com', NULL, '$2y$12$k.xc/jgfR58pShMvuB507.dDG9f7YYNC2E61PqnUBT603lZYIA29m', NULL, '2026-07-12 14:54:20', '2026-07-12 14:54:20'),
	(3, 'John Doe', 'john@example.com', NULL, '$2y$12$W5vgBpRz4wo0rL.NL6ezNeBq4yaZLOJdZ/JiaSgPDYI5FrwcceM6u', NULL, '2026-07-13 12:50:00', '2026-07-13 12:50:00'),
	(4, 'New User', 'user@example.com', NULL, '$2y$12$uJE3sMGM.ZIYSqDsYhpoFeU988PYi0oDWtJnF0KkNM8bsxBwS3Eq6', NULL, '2026-07-14 04:05:57', '2026-07-14 04:05:57'),
	(5, 'Jane Doe', 'jane@example.com', NULL, '$2y$12$rdSIC5qSh5sLhCEgPjVGXOAFqpBXjmMSAFcf04fyqrkz33A46pB4q', NULL, '2026-07-14 08:13:32', '2026-07-14 08:13:32'),
	(6, 'Jack', 'Jack@example.com', NULL, '$2y$12$u7V5w2qWJyM/V1a5B49zDO7bjHOHXWb79HP0bFEQq6XNaOcLKLGc.', NULL, '2026-07-14 22:09:31', '2026-07-14 22:09:31'),
	(7, 'Alice', 'alice@example.com', NULL, '$2y$12$RhoQ3aU3OGOo7WaMsw5x7eNbzOn.ON1LyclOppGrG/SeKR6nbouYS', NULL, '2026-07-14 22:21:08', '2026-07-14 22:21:08'),
	(8, 'random', 'random@example.com', NULL, '$2y$12$UNAabSilsBvIzyxyiYgDPuGwRzFpCpspdKuaO9BkrevfgkbXz/Ja.', NULL, '2026-07-14 22:28:24', '2026-07-14 22:28:24'),
	(9, 'Dan', 'dan@example.com', NULL, '$2y$12$zCFxgM0ANFuqCaolL/D3LOazT.E8Lz9hNMfN1ESGP26fpZUpODsh6', NULL, '2026-07-14 22:31:19', '2026-07-14 22:31:19');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

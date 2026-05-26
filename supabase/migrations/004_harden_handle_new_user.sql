-- ============================================================
-- Harden handle_new_user — lock search_path + revoke RPC exposure
-- ============================================================
-- Fungsi ini cuma dipanggil oleh trigger on_auth_user_created.
-- Default-nya SECURITY DEFINER + search_path mutable + EXECUTE granted
-- ke PUBLIC, jadi anon/authenticated bisa panggil lewat
-- /rest/v1/rpc/handle_new_user. Tidak diinginkan.
-- Fix: kunci search_path ke kosong (tabel sudah fully-qualified
-- di body fungsi), dan cabut EXECUTE dari PUBLIC/anon/authenticated.
-- ============================================================

ALTER FUNCTION public.handle_new_user() SET search_path = '';

REVOKE EXECUTE ON FUNCTION public.handle_new_user() FROM PUBLIC;
REVOKE EXECUTE ON FUNCTION public.handle_new_user() FROM anon;
REVOKE EXECUTE ON FUNCTION public.handle_new_user() FROM authenticated;

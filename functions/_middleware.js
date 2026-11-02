const EXACT = {
  '/ar/blog/تذكيرات-تغيير-الزيت-بالمسافة-أو-بالوقت/': '/ar/blog/tdhkyrat-tghyyr-alzyt-balmsafa-aw-balwqt/',
  '/ar/blog/سجل-صيانة-السيارة-والدراجة-مرتب-عاما-بعد-عام/': '/ar/blog/sjl-syana-alsyara-waldraja-mrtb-aama-bad-aam/',
  '/ar/blog/ضريبة-الرخصة-السنوية-لا-يفوتك-الموعد/': '/ar/blog/dryba-alrkhsa-alsnwya-la-yfwtk-almwad/',
  '/en/blog/pajak-stnk-tahunan': '/en/blog/yearly-stnk-tax-never-miss-the-deadline/',
  '/en/blog/pengingat-ganti-oli': '/en/blog/oil-change-reminders-by-distance-or-time/',
  '/en/blog/riwayat-servis-mobil-motor': '/en/blog/car-and-bike-service-history-tidy-year-after-year/',
  '/id/blog/pajak-stnk-tahunan/': '/id/blog/pajak-stnk-tahunan-jangan-sampai-terlewat/',
  '/id/blog/pengingat-ganti-oli/': '/id/blog/pengingat-ganti-oli-berdasar-jarak-atau-waktu/',
  '/id/blog/riwayat-servis-mobil-motor/': '/id/blog/riwayat-servis-mobil-dan-motor-rapi-dari-tahun-ke-tahun/',
  '/ja/blog/オイル交換通知距離または時間で/': '/ja/blog/oiru-koukan-tsuuchi-kyori-mataha-jikan-de/',
  '/ja/blog/年次-stnk-税期限を逃さない/': '/ja/blog/nenji-zei-kigen-wo-nogasa-nai/',
  '/ja/blog/車とバイクの整備史年々すっきり記録/': '/ja/blog/kuruma-to-baiku-no-seibi-shi-nennen-sukkiri-kiroku/',
  '/jv/blog/pajak-stnk-tahunan': '/jv/blog/pajak-stnk-tahunan-aja-nganti-kelewat/',
  '/jv/blog/pengingat-ganti-oli': '/jv/blog/pangeling-ganti-oli-manut-jarak-utawa-wektu/',
  '/jv/blog/riwayat-servis-mobil-motor': '/jv/blog/riwayat-servis-mobil-lan-motor-rapi-saka-taun-ke-taun/',
  '/su/blog/pajak-stnk-tahunan': '/su/blog/pajak-stnk-taunan-ulah-nepi-ka-kaliwat/',
  '/su/blog/pengingat-ganti-oli': '/su/blog/pangeling-ganti-oli-dumasar-jarak-atawa-waktu/',
  '/su/blog/riwayat-servis-mobil-motor': '/su/blog/riwayat-servis-mobil-jeung-motor-rapih-ti-taun-ka-taun/',
  '/zh/blog/年检车税别让截止日溜走/': '/zh/blog/nian-jian-che-shui-bie-rang-jie-zhi-ri-liu-zou/',
  '/zh/blog/换机油提醒按里程或按时间/': '/zh/blog/huan-ji-you-ti-xing-an-li-cheng-huo-an-shi-jian/',
  '/zh/blog/汽车摩托维保史年年整洁可查/': '/zh/blog/qi-che-mo-tuo-wei-bao-shi-nian-nian-zheng-jie-ke-cha/'
};

const BLOG_PATH = /^\/(id|en|ar|zh|ja|jv|su)\/blog\/./;

export async function onRequest(context) {
  const url = new URL(context.request.url);
  const decoded = decodeURIComponent(url.pathname);
  const mapped = EXACT[decoded];
  if (mapped) return Response.redirect(url.origin + mapped, 301);

  const response = await context.next();
  if (response.status !== 404) return response;

  // Anything still unresolved under a blog path goes to its locale index rather
  // than a dead end.
  if (BLOG_PATH.test(decoded)) {
    const locale = decoded.split("/")[1];
    return Response.redirect(`${url.origin}/${locale}/blog/`, 301);
  }
  return response;
}

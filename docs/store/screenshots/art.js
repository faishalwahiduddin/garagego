// GarageGo — slate steel automotive horizon with tachometer arcs & amber glow
(function () {
  const AMBER = '#F59E0B';
  let tachos = '';
  for (let sx of [1080, 2160, 3240]) {
    tachos += '<path d="M' + (sx - 180) + ',460 A180,180 0 0,1 ' + (sx + 180) + ',460" fill="none" stroke="#FFFFFF" stroke-width="12" opacity=".2"/>' +
              '<path d="M' + (sx - 180) + ',460 A180,180 0 0,1 ' + sx + ',280" fill="none" stroke="' + AMBER + '" stroke-width="12" opacity=".85" stroke-linecap="round"/>';
  }
  let road = '<path d="M-50,1580 L4370,1580" stroke="#FFFFFF" stroke-width="4" opacity=".25"/>' +
             '<path d="M-50,1660 L4370,1660" stroke="' + AMBER + '" stroke-width="6" stroke-dasharray="60 40" opacity=".6"/>';
  window.STORE_ART = {
    generic: false,
    theme: { bg: 'linear-gradient(160deg, #334155 0%, #1E293B 55%, #0F172A 100%)', ink: '#FFFFFF' },
    panoramaSvg:
      '<svg viewBox="0 0 4320 1920" preserveAspectRatio="xMidYMid slice" xmlns="http://www.w3.org/2000/svg">' +
        tachos + road +
      '</svg>',
    rtlReverse: true
  };
})();

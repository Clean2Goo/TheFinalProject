const track = document.querySelector(".carousel-track");
const slides = Array.from(track.children);
const nextButton = document.querySelector(".carousel-btn.next");
const prevButton = document.querySelector(".carousel-btn.prev");

let currentIndex = 0;
const slideInterval = 3000; // 3초마다 슬라이드 이동

// 슬라이드 위치 업데이트
const updateSlidePosition = () => {
  const slideWidth = slides[0].getBoundingClientRect().width;
  track.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
};

// 다음 슬라이드로 이동
const moveToNextSlide = () => {
  currentIndex++;

  if (currentIndex >= slides.length) {
    currentIndex = 0; // 첫 번째 슬라이드로 돌아감
  }

  updateSlidePosition();
};

// 이전 슬라이드로 이동
const moveToPrevSlide = () => {
  currentIndex--;

  if (currentIndex < 0) {
    currentIndex = slides.length - 1; // 마지막 슬라이드로 이동
  }

  updateSlidePosition();
};

// 버튼 클릭 이벤트
nextButton.addEventListener("click", () => {
  moveToNextSlide();
  resetAutoSlide();
});

prevButton.addEventListener("click", () => {
  moveToPrevSlide();
  resetAutoSlide();
});

// 자동 순환 기능
let autoSlide = setInterval(moveToNextSlide, slideInterval);

// 자동 순환 재시작
const resetAutoSlide = () => {
  clearInterval(autoSlide);
  autoSlide = setInterval(moveToNextSlide, slideInterval);
};

// 창 크기 변경 시 슬라이드 위치 조정
window.addEventListener("resize", updateSlidePosition);

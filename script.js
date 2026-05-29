const menuToggle = document.querySelector(".menu-toggle");
const menu = document.querySelector(".menu");

if (menuToggle && menu) {
  const setMenuOpen = (open) => {
    menu.classList.toggle("open", open);
    menuToggle.setAttribute("aria-expanded", String(open));
    menuToggle.setAttribute("aria-label", open ? "Fermer le menu" : "Ouvrir le menu");
  };

  menuToggle.addEventListener("click", () => {
    setMenuOpen(!menu.classList.contains("open"));
  });

  menu.querySelectorAll("a").forEach((link) => {
    link.addEventListener("click", () => setMenuOpen(false));
  });
}

document.querySelectorAll("img[data-fallback]").forEach((img) => {
  img.addEventListener("error", () => {
    if (img.dataset.fallback && img.src !== img.dataset.fallback) {
      img.src = img.dataset.fallback;
    }
  });
});

const hero = document.querySelector(".hero");
if (hero) {
  const heroImage = new Image();
  heroImage.src = "assets/images/hero.jpg";
  heroImage.onerror = () => {
    hero.style.backgroundImage = 'url("assets/images/hero.svg")';
  };
}

const revealItems = document.querySelectorAll(
  ".section, .service-card, .gallery-grid img, .about-images img, .testimonial-card"
);

const revealObserver = new IntersectionObserver(
  (entries, observer) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible");
        observer.unobserve(entry.target);
      }
    });
  },
  { threshold: 0.12 }
);

revealItems.forEach((item) => {
  item.classList.add("reveal");
  revealObserver.observe(item);
});

const backToTop = document.querySelector(".back-to-top");

if (backToTop) {
  const toggleBackToTop = () => {
    const pageMiddle =
      (document.documentElement.scrollHeight - window.innerHeight) / 2;
    const show = window.scrollY >= pageMiddle;
    backToTop.classList.toggle("visible", show);
    backToTop.hidden = !show;
  };

  window.addEventListener("scroll", toggleBackToTop, { passive: true });
  window.addEventListener("resize", toggleBackToTop, { passive: true });
  toggleBackToTop();

  backToTop.addEventListener("click", () => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  });
}

const REVIEWS_KEY = "beauty-reviews";
const reviewForm = document.querySelector(".review-form");
const reviewsItems = document.querySelector(".reviews-items");
const reviewsEmpty = document.querySelector(".reviews-empty");
const reviewFormMessage = document.querySelector(".review-form-message");

const getReviews = () => {
  try {
    const stored = localStorage.getItem(REVIEWS_KEY);
    return stored ? JSON.parse(stored) : [];
  } catch {
    return [];
  }
};

const saveReviews = (reviews) => {
  localStorage.setItem(REVIEWS_KEY, JSON.stringify(reviews.slice(0, 50)));
};

const renderStars = (note) => {
  const safeNote = Math.min(5, Math.max(1, Number(note) || 0));
  return `${"★".repeat(safeNote)}${"☆".repeat(5 - safeNote)}`;
};

const renderReviews = () => {
  if (!reviewsItems || !reviewsEmpty) return;

  const reviews = getReviews();
  reviewsEmpty.hidden = reviews.length > 0;
  reviewsItems.innerHTML = reviews
    .map(
      (review) => `
        <article class="review-item">
          <div class="review-item-head">
            <span class="review-field">
              <span class="review-label">Nom</span>
              <strong>${escapeHtml(review.nom)}</strong>
            </span>
            <span class="review-field">
              <span class="review-label">Service</span>
              <strong>${escapeHtml(review.service)}</strong>
            </span>
            <span class="review-field review-field-stars">
              <span class="review-label">Note</span>
              <span class="review-stars" aria-label="${review.note} sur 5">${renderStars(review.note)}</span>
            </span>
          </div>
          <p class="review-item-comment">${escapeHtml(review.commentaire)}</p>
        </article>
      `
    )
    .join("");
};

const escapeHtml = (value) =>
  String(value)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");

const showReviewMessage = (text, isError = false) => {
  if (!reviewFormMessage) return;
  reviewFormMessage.textContent = text;
  reviewFormMessage.hidden = false;
  reviewFormMessage.classList.toggle("is-error", isError);
};

if (reviewForm) {
  renderReviews();

  reviewForm.addEventListener("submit", (event) => {
    event.preventDefault();
    const data = new FormData(reviewForm);
    const nom = data.get("nom")?.toString().trim();
    const service = data.get("service")?.toString();
    const note = Number(data.get("note"));
    const commentaire = data.get("commentaire")?.toString().trim();

    if (!nom || !service || !note || !commentaire) {
      showReviewMessage("Merci de remplir tous les champs obligatoires.", true);
      return;
    }

    const reviews = getReviews();
    reviews.unshift({
      nom,
      service,
      note,
      telephone: data.get("telephone")?.toString().trim() || "",
      commentaire,
      date: new Date().toISOString(),
    });

    saveReviews(reviews);
    reviewForm.reset();
    renderReviews();
    showReviewMessage("Merci ! Votre avis a été publié.");
  });
}

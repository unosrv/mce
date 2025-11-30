/**
 * Backpex Form Buttons Reorder
 *
 * Moves edit form action buttons outside the card container.
 * This is needed because Backpex places buttons inside .card-body,
 * but we want them outside the card for better visual separation.
 */

function moveFormButtons() {
  // Find all form button containers inside cards
  // Selector: buttons container inside card-body that has the Backpex action button styling
  const buttonContainers = document.querySelectorAll(
    '.card .card-body > .rounded-b-box.flex.items-center.justify-end'
  );

  buttonContainers.forEach((container) => {
    // Skip if already moved (has our marker class)
    if (container.dataset.buttonsMoved === 'true') return;

    // Find the parent card element
    const card = container.closest('.card');
    if (!card) return;

    // Mark as moved to prevent re-processing
    container.dataset.buttonsMoved = 'true';

    // Add custom class for styling
    container.classList.add('form-actions-container');

    // Move the container to be a sibling AFTER the card
    card.parentNode.insertBefore(container, card.nextSibling);

    // Remove the rounded bottom corners since it's no longer inside the card
    container.classList.remove('rounded-b-box');
  });
}

// Run on initial page load
document.addEventListener('DOMContentLoaded', moveFormButtons);

// Run after LiveView updates
window.addEventListener('phx:page-loading-stop', () => {
  // Small delay to ensure DOM is fully updated
  requestAnimationFrame(moveFormButtons);
});

// Use MutationObserver to catch dynamically added content
const observer = new MutationObserver((mutations) => {
  // Check if any mutation added nodes that might contain our target
  const hasNewCards = mutations.some(mutation =>
    mutation.addedNodes.length > 0 &&
    Array.from(mutation.addedNodes).some(node =>
      node.nodeType === 1 && (
        node.classList?.contains('card') ||
        node.querySelector?.('.card')
      )
    )
  );

  if (hasNewCards) {
    requestAnimationFrame(moveFormButtons);
  }
});

// Start observing once DOM is ready
document.addEventListener('DOMContentLoaded', () => {
  observer.observe(document.body, {
    childList: true,
    subtree: true
  });
});

export { moveFormButtons };

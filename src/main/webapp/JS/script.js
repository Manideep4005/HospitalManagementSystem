function toggleMenu(event) {
	event.preventDefault();
	event.stopPropagation(); // Stop click from bubbling up

	// Get the dropdown content and toggle display
	// const dropdownContent = this.nextElementSibling;

	const dropmenu = document.querySelector(".header-1-menu");
	const isOpen = dropmenu.style.display === "block";

	// Close all dropdowns
	document.querySelector(".header-1-menu").style.display = "none";

	// Toggle the clicked dropdown
	dropmenu.style.display = isOpen ? "none" : "block";
}

function toggledropdown(event) {
	event.preventDefault();
	event.stopPropagation(); // Stop click from bubbling up

	// Get the dropdown content and toggle display
	// const dropdownContent = this.nextElementSibling;

	const dropmenu = document.querySelector(".sub-menu");
	const isOpen = dropmenu.style.display === "flex";

	// Close all dropdowns
	document.querySelector(".sub-menu").style.display = "none";

	// Toggle the clicked dropdown
	dropmenu.style.display = isOpen ? "none" : "flex";
}

function togglesidebarsubmenu(event) {
	event.preventDefault();
	event.stopPropagation(); // Stop click from bubbling up

	// Get the dropdown content and toggle display
	// const dropdownContent = this.nextElementSibling;

	const dropmenu = document.querySelector(".side-bar-sub-menu");
	const isOpen = dropmenu.style.display === "block";
	const angle = document.querySelector("#side-bar-angle-right");
	const angleRight =
		document.querySelector("#side-bar-angle-right").style.transform ===
		"rotate(90deg)";

	// Close all dropdowns
	document.querySelector(".side-bar-sub-menu").style.display = "none";
	document.querySelector("#side-bar-angle-right").style.transform =
		"none";

	// Toggle the clicked dropdown
	dropmenu.style.display = isOpen ? "none" : "block";
	dropmenu.style.margin = "10px";
	angle.style.transform = angleRight ? "none" : "rotate(90deg)";
}

function openSideBar() {
  const sidebar = document.querySelector(".side-bar");
  sidebar.classList.add("active");
  overlay.classList.add("show");
}

function closeSideBar() {
  const sidebar = document.querySelector(".side-bar");
  sidebar.classList.remove("active");
  overlay.classList.remove("show");
}



const openmenu = document.getElementById("open-menu");
const dropdownbtn = document.querySelectorAll(".dropdownbtn");
const sidebardropdownbtn = document.querySelectorAll(
	".side-bar-dropdown-btn"
);

const overlay = document.querySelector(".overlay");

openmenu.addEventListener("click", toggleMenu);

dropdownbtn.forEach((button) => {
	button.addEventListener("click", toggledropdown);
});

sidebardropdownbtn.forEach((button) => {
	button.addEventListener("click", togglesidebarsubmenu);
});

document
	.getElementById("open-side-bar")
	.addEventListener("click", openSideBar);

document
	.getElementById("close-side-bar")
	.addEventListener("click", closeSideBar);

overlay.addEventListener("click", closeSideBar);

document.addEventListener("click", () => {
	console.log("document clicked");
	document.querySelector(".header-1-menu").style.display = "none";
	document.querySelector(".sub-menu").style.display = "none";
});

document.addEventListener("keydown", function(e) {
	if (e.key === "Escape") {
		closeSideBar();
		document.querySelector(".header-1-menu").style.display = "none";
		document.querySelector(".sub-menu").style.display = "none";
	}
});

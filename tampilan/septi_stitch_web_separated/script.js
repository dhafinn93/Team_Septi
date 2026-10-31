// State Management
        let currentTab = 'home';
        let userMeasurements = {
            'Pribadi': { ld: 92, lp: 74, lpinggul: 98, bahu: 38, lengan: 56, pbaju: 135 },
            'Suami': { ld: 102, lp: 88, lpinggul: 104, bahu: 45, lengan: 60, pbaju: 75 },
            'Anak': { ld: 70, lp: 60, lpinggul: 72, bahu: 30, lengan: 42, pbaju: 55 }
        };
        let activeProfile = 'Pribadi';

        // Tab Navigation Controller
        function switchTab(tabId) {
            // Hide all tabs
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });

            // Deactivate all nav buttons
            document.querySelectorAll('.nav-btn').forEach(btn => {
                btn.classList.remove('text-brand-gold', 'active');
                btn.classList.add('text-slate-400');
            });

            // Show selected tab
            const targetView = document.getElementById(`view-${tabId}`);
            if (targetView) {
                targetView.classList.add('active');
            }

            // Activate nav button
            const targetNav = document.getElementById(`nav-${tabId}`);
            if (targetNav) {
                targetNav.classList.remove('text-slate-400');
                targetNav.classList.add('text-brand-gold', 'active');
            }

            currentTab = tabId;
            // Scroll to top of view
            document.querySelector('main').scrollTop = 0;
        }

        // Catalog Filter
        function filterCatalog(category, btn) {
            document.querySelectorAll('.catalog-filter-btn').forEach(b => {
                b.classList.remove('bg-brand-navy', 'text-white', 'shadow-sm');
                b.classList.add('bg-white', 'text-slate-600');
            });
            btn.classList.remove('bg-white', 'text-slate-600');
            btn.classList.add('bg-brand-navy', 'text-white', 'shadow-sm');

            const items = document.querySelectorAll('.catalog-item');
            items.forEach(item => {
                if (category === 'all' || item.classList.contains(category)) {
                    item.style.display = 'flex';
                } else {
                    item.style.display = 'none';
                }
            });
        }

        // Select Catalog item into Order Form
        function selectCatalogItem(modelName) {
            document.getElementById('orderModelName').value = modelName;
            switchTab('order');
            showToast(`Model "${modelName}" dipilih!`);
        }

        // Fabric source option toggle
        function toggleFabricOption() {
            const fabricSource = document.querySelector('input[name="fabricSource"]:checked').value;
            const noteBox = document.getElementById('fabricNoteBox');
            if (fabricSource === 'Disediakan Penjahit') {
                noteBox.querySelector('label').textContent = 'Keinginan Jenis Kain & Warna';
            } else {
                noteBox.querySelector('label').textContent = 'Catatan Jenis Kain & Warna';
            }
        }

        // Measurement Profile Switcher
        function switchProfile(profileKey) {
            activeProfile = profileKey;
            
            document.querySelectorAll('.prof-tab').forEach(b => {
                b.classList.remove('bg-white', 'text-brand-navy', 'font-bold', 'shadow-sm');
                b.classList.add('text-slate-600');
            });
            const selectedBtn = document.getElementById(`prof-${profileKey}`);
            if(selectedBtn) {
                selectedBtn.classList.add('bg-white', 'text-brand-navy', 'font-bold', 'shadow-sm');
                selectedBtn.classList.remove('text-slate-600');
            }

            // Fill inputs with profile values
            const m = userMeasurements[profileKey];
            if (m) {
                document.getElementById('m_ld').value = m.ld;
                document.getElementById('m_lp').value = m.lp;
                document.getElementById('m_lpinggul').value = m.lpinggul;
                document.getElementById('m_bahu').value = m.bahu;
                document.getElementById('m_lengan').value = m.lengan;
                document.getElementById('m_pbaju').value = m.pbaju;
            }

            document.getElementById('selectedProfileName').textContent = `Profil: Ukuran ${profileKey}`;
        }

        // Save Measurements
        function saveMeasurementsToast() {
            // Read values
            userMeasurements[activeProfile] = {
                ld: document.getElementById('m_ld').value,
                lp: document.getElementById('m_lp').value,
                lpinggul: document.getElementById('m_lpinggul').value,
                bahu: document.getElementById('m_bahu').value,
                lengan: document.getElementById('m_lengan').value,
                pbaju: document.getElementById('m_pbaju').value
            };
            showToast(`Ukuran (${activeProfile}) berhasil disimpan!`);
        }

        // Accordion Toggle
        function toggleGuideAccordion() {
            const content = document.getElementById('guideContent');
            const icon = document.getElementById('guideIcon');
            content.classList.toggle('hidden');
            icon.classList.toggle('rotate-180');
        }

        // File Preview Helper
        function handleFilePreview(input) {
            if (input.files && input.files[0]) {
                const preview = document.getElementById('filePreview');
                const nameSpan = document.getElementById('fileName');
                nameSpan.textContent = input.files[0].name;
                preview.classList.remove('hidden');
            }
        }

        // Order Form Handler
        function handleOrderSubmit(e) {
            e.preventDefault();
            const modelName = document.getElementById('orderModelName').value;
            showToast('Pesanan jahit berhasil dikirimkan!');
            setTimeout(() => {
                switchTab('tracking');
            }, 1000);
        }

        // Price Estimator Logic
        function openEstimatorModal() {
            document.getElementById('estimatorModal').classList.remove('hidden');
            calculatePrice();
        }

        function closeEstimatorModal() {
            document.getElementById('estimatorModal').classList.add('hidden');
        }

        function calculatePrice() {
            const base = parseInt(document.getElementById('estCategory').value) || 0;
            const complexity = parseInt(document.getElementById('estComplexity').value) || 0;
            const furing = parseInt(document.getElementById('estFuring').value) || 0;
            const total = base + complexity + furing;

            document.getElementById('estResult').textContent = `Rp ${total.toLocaleString('id-ID')}`;
        }

        function useEstimatedPrice() {
            closeEstimatorModal();
            switchTab('order');
            showToast('Estimasi harga diterapkan ke formulir!');
        }

        // Contact Penjahit WhatsApp Trigger
        function contactTailorWA() {
            const phone = "6281234567890";
            const message = encodeURIComponent("Halo Septi Stitch, saya mau tanya progress pesanan jahit kebaya #ST-88219.");
            window.open(`https://wa.me/${phone}?text=${message}`, '_blank');
        }

        // Toast Notification System
        function showToast(message) {
            const toast = document.getElementById('toast');
            const toastMessage = document.getElementById('toastMessage');
            toastMessage.textContent = message;

            toast.classList.remove('opacity-0', 'scale-90', 'pointer-events-none');
            toast.classList.add('opacity-100', 'scale-100');

            setTimeout(() => {
                toast.classList.remove('opacity-100', 'scale-100');
                toast.classList.add('opacity-0', 'scale-90', 'pointer-events-none');
            }, 2500);
        }
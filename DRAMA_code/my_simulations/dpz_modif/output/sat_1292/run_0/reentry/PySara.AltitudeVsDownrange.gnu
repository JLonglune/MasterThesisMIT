reset
set datafile separator whitespace
set term png size 960,480

set o 'PySara.AltitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid

set key font ",7"
set key below 
set title 'Altitude vs Downrange of all Objects'noenhanced font ",14"
set xlabel 'Downrange [km]' font ",14"
set ylabel 'Altitude [km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' pt 1 ps 3

plot \
'PySara.Compound_of-_IFring-PLM-SVM-SolarP.2586696812663314322_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Compound_of-_IFring-PLM-SVM.17068167775374247114_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RSJD.3cecd9af-b84c-463a-9918-027600ab7a28_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EIU.fd99f765-a3fa-468b-bcd5-016d167f3fbf_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RWheel1.30601a1f-e611-4a72-8c68-0ba8610c2e29_Trajectory.txt' using 6:2 w l lw 3 title 'RWheel1' noenhanced, \
'PySara.RWheel2.37335509-7a26-4e33-8286-b58da32b5558_Trajectory.txt' using 6:2 w l lw 3 title 'RWheel2' noenhanced, \
'PySara.RWheel3.3643ab44-f912-4884-babe-b7c09067369a_Trajectory.txt' using 6:2 w l lw 3 title 'RWheel3' noenhanced, \
'PySara.SADME.64b02e72-4243-475a-a0f7-8c6fa719a799_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.MAC-Y.58c3bdfd-4512-4407-8fd3-89664a00dd56_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.CCU.f1c16680-da40-4038-85b6-afd9b8962bbf_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BSP.68243c07-bf67-48dd-a108-e7887f700348_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.OBA.6b65f60c-f3de-4858-8692-c9b8da4d7420_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EDR.4e7a4b59-cee7-44f5-ae91-a119ddf2194d_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EPRM.6d068f8c-42c1-4e67-8a34-0e2d5d014c75_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.TRSP1.08f70220-a2ed-4614-8a03-7ee53d774fd8_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.TRSP2.e6de9af4-9b9e-438c-9f5f-4f5d2d97b59e_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BEG1.f120bce6-ee18-485a-95c4-14304c34293c_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BEG2.4c87b281-88d9-47ea-ba35-3c43a092e79b_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BEG3.ff0691b0-9eec-427c-aca7-0945f2dbf535_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BEG4.fe133580-a71f-4b46-ac90-7df387aa120d_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Gyrosbl.43089cf7-03c5-4130-a53f-e1761f4b1c62_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.T4S.d5048910-9fae-46a6-bc06-68f2fe96939e_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EAIM.049e68a2-6063-4a2e-b6f1-5aa39107fb56_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.STD1.53b0fa25-337a-4801-adfb-b655009abdda_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.STD2.c24a38cf-ff8c-4cde-a033-d25fec03e6c6_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SSD1.1c6e2a4b-455a-40f6-847c-93a50aad2901_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SSD2.f492f331-b2d3-4479-8af7-582adf808112_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SADM1.f7acf7c6-ccd2-4fc7-a596-8e3599a1dcc5_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SADM2.5feabfca-0490-48e9-91dc-79fdc5a134a5_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp1.0b1661d3-c0c1-4f6a-a6d1-2a5db00bda4f_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp2.7a44a685-ffd8-43e7-b137-a97750163298_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp3.2e87c0ee-756b-4448-815f-fa04e03fb958_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp4.3b252b2a-d37f-42cc-b3d0-c66451d5a10e_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp5.b780d3fd-f6d3-4fe4-9213-52c680cd507b_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp6.37f2601a-bcea-4ac9-a273-b5e54ee7b8ce_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp7.a62cc748-c9ce-417e-934a-fca18bb1acd7_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp8.3c98b668-d3c6-4e6c-9b25-feb7c56786a3_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp9.77d47b62-c869-4b6f-a4c0-5973fed2ce1b_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp10.6094c339-cbad-4f0b-acf1-bf8d9925b55e_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp11.fdc2bf45-208d-4956-ba49-3de42686e018_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAsupp12.b1918ad3-a023-4f41-b015-4e42f20225e3_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.CentCone.a6bfcbfa-60aa-4e7a-bf6f-ed921bdc8db6_Trajectory.txt' using 6:2 w l lw 3 title 'CentCone' noenhanced, \
'PySara.Ribpanel1.883e64dd-f62a-4f0f-b648-6335de21ffe8_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Ribpanel2.9e3c26d3-2fd2-49cd-b644-ff0bf4e0e01c_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Ribpanel3.e31d9ace-fa64-4d22-a535-fae55be369cf_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Ribpanel4.ca9090da-15bd-4e01-b2be-164e9518a87d_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Ribpanel5.58b6c41a-1b21-46ff-9726-bae063599b2f_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BatFloor.3f5a8f7d-39ce-4a62-bb78-f5530384abfa_Trajectory.txt' using 6:2 w l lw 3 title 'BatFloor' noenhanced, \
'PySara.IntRing.c3301475-8229-4bb1-b60e-0685f572310b_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PropStr.bca3f3ba-1ce7-4cca-a1ae-583496a30689_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Tank1.9e7d164a-03c6-443b-a8dd-67661cfc0a2d_Trajectory.txt' using 6:2 w l lw 3 title 'Tank1' noenhanced, \
'PySara.Tank2.3d841389-2064-480e-87b2-bedfd6570cd3_Trajectory.txt' using 6:2 w l lw 3 title 'Tank2' noenhanced, \
'PySara.Tank3.b44d182e-cc26-4486-970c-ebf58aa27cc0_Trajectory.txt' using 6:2 w l lw 3 title 'Tank3' noenhanced, \
'PySara.Tank4.8d404d07-39cb-4bdd-be3e-90c64523e7f8_Trajectory.txt' using 6:2 w l lw 3 title 'Tank4' noenhanced, \
'PySara.ValvTran1.ede47fd6-52f1-47c4-b4dc-efc11d542e23_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ValvTran2.d434ed3a-2eb2-42cd-9156-a61e1e3e9de8_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ValvTran3.e3e44d35-027b-4caf-a9ef-a1f6bd2be195_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ValvTran4.e09ab47f-053d-4141-9264-f8406883a641_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ValvTran5.58838c96-18ea-434d-800d-53cb3df3f2e4_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ValvTran6.87c6b95c-c224-448c-87c5-2d4715000bb0_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery1.1ad2f9ff-fe8a-46ef-a8f9-205220abdfe0_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery2.5f1e2153-5905-45f9-a31e-e6178b321fa2_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery3.d62ffb09-5716-42d4-9382-65e4c7f6ab3a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery4.5650f82c-a8f5-4122-9599-3bc5b665f544_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery5.add9fe66-608e-4d9e-8747-8ace1c56ec7e_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Compound_of-_IFring-PLM.11649713141016156716_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RSJD-Internal.5bacc617-4464-48a2-83cf-6fc1f26debe1_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EIU-Internal.a4ad07b7-4942-4549-a032-e30cb8335b15_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SADME-internal.90ca8adc-c94c-4d14-90d9-b6129423ce10_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.CCU-internal.e993bb4e-86ad-4974-892d-812c328dd123_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BSP-internal.18640ad2-7a65-4804-b9ff-39c7f5f01c19_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EDR-internal.e95fb00d-0612-45b8-8e8e-80e421fe680b_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EPRM-internal.4c707658-3801-43cf-b238-692903c62d74_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BEG1-internal.5c21536a-0e84-43a2-8d79-67e5144db0fe_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BEG2-internal.744a2caf-92f7-41cb-ae64-9d42bf09dae9_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BEG3-internal.c69822fa-e85e-4556-ac1d-df65390206fe_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.BEG4-internal.3c6906cb-7f1e-4e8f-b3d1-3bb537bf4e8d_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.T4S-internal.a0c88fb0-24e0-4b3e-822e-1f368f29f966_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EAIM-internal.30623271-c50e-43a6-b8ba-4335d896856c_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SADM1_internal.527057a7-0dc1-4411-a9f9-d4ac6fbbdcd5_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SADM2-internal.40fdfd8c-e723-4faa-9e1f-5f012fbe443a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery1-Internal.84b286ec-9706-4b76-a6d4-680730125719_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery2-Internal.5be38dbb-9613-4029-8b3a-b498255675e4_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery3-Internal.08cfbcac-d179-4dd9-b7a8-2a67780b74c3_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery4-Internal.401bb612-2bc0-44d9-96ce-e323c7e90de9_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.Battery5-Internal.20af93ad-5ebd-46c6-a4f2-3685f2c0e808_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PLM.a8c52bba-8078-4fb0-94fe-07d876624d0a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.MHS-MPU.4493b82b-537f-484f-a043-f11b7218cd9a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.MHS-DBU.8f0e4793-b4fc-4da0-a3c0-3b9bdd107b54_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATEPC1.dc87ebbf-2446-4c40-82dd-b8ddb8f1792f_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATEPC2.920c5867-100c-49f7-9a2c-7ed8aabaa7d7_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATSSP1.4d596ab3-b5ce-4370-977f-1a8802bcf123_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATSSP2.d9317e02-26d0-4830-8c01-9ebc2ef0f4b3_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATHRS.e451289e-5733-4b98-b37f-782c24ac28c2_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PMC1.83dad51f-37d0-4124-9403-f580da4ebf8a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PMC2.a261a43f-3462-49fe-84c0-84b2b962f6cc_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PDU1.37f2a36b-037c-4601-9860-d38c96cfe837_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PDU2.ac05789d-ceab-4104-872c-4ee319af1a22_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RFCU1.35fe65c9-d736-4b8e-8f98-c94b442186cd_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RFCU2.03d80678-6f38-48b9-b979-dc9107292c5a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RFCU3.cca2ac02-e211-405c-b716-e6c1cd129c79_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RFCU4.17647099-9fb9-40b7-806d-bf0f8fac8fec_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RFCU5.aaea633f-d320-4f1f-a46f-cc29fcbe07d0_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RTU.0e4d15da-49b2-41fa-98b0-a5585fd78673_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SLAFilt.1d8e383c-f44d-4ee9-9c7c-6404be09785b_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SARP-3.ea1ec5f4-71bd-4969-a2c3-09fede1031de_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAR-Rx.7e04c61e-3319-481b-af18-815f518ca060_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAR-Tx.2174174d-8633-470f-81db-77add3252e0f_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EPC1.5c9117c9-e7e8-4ac5-aaa0-a1bb250993c4_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.EPC2.c1df8c05-4d71-4dac-890b-8dfe07faebfd_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.MOD1.a96dc980-3752-485f-aa0d-ed740e37d25d_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.MOD2.94042813-871f-46d9-8c75-bba5b9eefad3_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.TWT1.ca771f25-62f2-4bfd-8f54-cd4a023babb9_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.TWT2.6341690f-7e4a-4f2f-b43f-0b599229e8bd_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SRADipl.dddb594c-b70e-477c-997f-a3cee0aabb6a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.LNA1.54057886-ee13-4de3-b706-09335b907ef9_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.LNA2.a109f4b6-933c-4eb4-a666-ee614c3ccea0_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.UDAFilt.be162043-2e68-4301-8cb7-d976f931cb2e_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.DBU1.a1562f60-89d0-4c32-8df9-9e866690321b_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.DBU2.afbd0b58-1f59-4fce-b54e-124fe1757b32_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.DBU3.722b4cf1-1310-4628-9486-22f4fa9b6c8f_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.DBU4.3ffb2aa0-ae2b-4fa1-a710-82ae67847b75_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.DBU5.d4b1a285-ba8d-4058-8c58-0b7606d876b2_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATRFU1.7b23cf75-49aa-4269-b7bf-5e9d45bc1f5f_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATRFU2.ca777b00-e3d2-4e6c-8afa-c1257614e57c_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.IASI-DPS.793e2de2-3c73-4ec5-9159-6715937b7cbe_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RFCU.5e7648dc-e783-4bff-828d-ce1c7dd5f7ad_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.IASI-IMS.48e437f7-524f-4623-953b-871dd238a6a6_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.DPU-SEM.bd7f8fe5-b32a-460c-b396-4790d4115078_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PCU.ec290029-8b8b-41f1-84b5-0156600c4465_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.TCU.5730fc2c-e436-4d0d-8aff-7db103d50d08_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.FMU1.8c6e4d00-4ff8-4a89-ba8f-3af08b2a8d80_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.FMU2.d48a1d8d-51ba-40f2-b422-84fe47391013_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SSR.d83a9294-4d46-4254-ace5-ff9fae05622a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.NIU.e2f95e2d-87da-419c-9e0a-23294d603d7d_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.L-SSPA1.763a5740-f52b-4032-a209-7105dc417fab_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.L-SSPA2.4b304909-5d7f-4f20-91a7-3bd1c56ace98_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.LH-MOD1.83aefc6e-b733-489f-8bff-5aa78232a652_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.LH-MOD2.f7ebcbcd-3269-482a-b7d7-cbbdd52f58a3_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.H-SSPA1.b25dc4d9-13c8-482a-a299-dd01fd08ebdb_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.H-SSPA2.50035c84-d1c9-41bb-82a1-2b10a91569f0_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ADCS-RPU.6be146fd-6b3d-48d2-8140-ddc02a7b864d_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ADCS-TXU.7f55c236-864e-40ed-87fc-4a26da0a0229_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.GRAS-GEU.3e3557b4-6663-48e9-990d-b3153e71579a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATICU1.9bc2cd0a-edc1-4207-b092-33d16198b231_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATICU2.31b09dff-babf-48dd-ad99-ac5aef3469e6_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATDPU1.50b225ea-27a3-4948-ba7e-9eb0aaa2833f_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATDPU2.52086079-11dd-4ba5-86f1-ac04d0947720_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.IASI.429cbd40-c6c5-43fd-b460-fc5cd243292f_Trajectory.txt' using 6:2 w l lw 3 title 'IASI' noenhanced, \
'PySara.Cylind1.ae599747-ecf5-4232-aa46-521c56c71902_Trajectory.txt' using 6:2 w l lw 3 title 'Cylind1' noenhanced, \
'PySara.Cylind2.5e2ba905-2d33-4714-9e11-8737eed848d1_Trajectory.txt' using 6:2 w l lw 3 title 'Cylind2' noenhanced, \
'PySara.SheWallY1.96053455-f40c-41f0-a511-c27a3d1ac7f2_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SheWallY2.7059b08a-c312-4b65-94ec-4f9a27039aff_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SheWallY3.5a728766-3fb7-4ba3-b682-c61b4be6dca8_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SheWallY4.a223b4fe-73fe-48b7-a127-0fefb89338e0_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SheWallZ1.59583a85-bcfd-47ed-bdab-daa3f7c171bf_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SheWallZ2.96825daa-1189-41a4-8029-c7f260f99328_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.MHS-MPU-internal.bccfff9a-9117-41e8-934d-f2f5d29f1e79_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATEPC1-internal.2622fa08-adbb-4190-a652-7df2c8d0e121_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATEPC2-internal.f540ee8e-8f74-4412-be6c-2f8cd56cf0ec_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PMC1-internal.dc2e6f52-c5a9-428b-98b3-1079deb95298_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PMC2-internal.cd804e82-b086-4b5e-9554-a6d5a8e0c269_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PDU1-internal.6d9ff6a9-d7ca-4720-bf90-516d7349c993_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PDU2-internal.03150939-69bd-458d-8058-caff2c4ea0c9_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.RTU-internal.d59415d8-a001-4fcb-a193-705b75585286_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SARP-3-internal.792e896a-aee6-4a79-8dde-e7ec1261d254_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SAR-Rx-internal.1dcdc0b7-5a99-4983-bf05-64fc5adb56cc_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATRFU1-internal.2fbd2027-dca6-4c81-96a5-d16370765a92_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATRFU2-internal.b4629894-68e0-430d-96b4-302f95184b87_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.IASI-DPS-internal.122eb294-6444-456e-9a34-b927575ac0d3_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.IASI-IMS-internal.4c90b642-dc9f-481d-89b1-f740beeca2a8_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.DPU-SEM-internal.18188eff-2b92-455e-a3f4-fa1e2c162e7d_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.PCU-internal.2c7ac34c-7ef6-4bb5-8b4f-9f474c250573_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.TCU-internal.00bcb475-9d93-4ea9-bf21-a95c5c8f92db_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.SSR-internal.5a61b908-b1a2-4a5d-aa6a-3bb5de02b2e1_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.NIU-internal.c2ab41aa-4d29-4562-881d-250dc4304964_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ADCS-RPU-internal.4b346112-6fa3-4fb4-9c45-23962cc2bdaf_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ADCS-TXU-internal.8fb80bdc-9527-4c99-a844-ed98ae3af01e_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.GRAS-GEU-internal.c5c7c6a5-c37c-4edb-82c0-29b8a4eedfd7_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATDPU1-internal.12c176cb-6d99-4ed9-b863-4489f06050e1_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.ASCATDPU2-internal.4c723066-bc05-41f7-a3c9-a43fed6bd09a_Trajectory.txt' using 6:2 w l lw 1 title '', \
'PySara.demiseData.txt' using 6:2 w p ls 1 lw 3 title 'Demise points', \
'PySara.ballooningData.txt' using 6:2 w p ls 2 lw 3 title 'Ballooning points', \
'PySara.uncriticalData.txt' using 6:2 w p ls 4 lw 3 title 'Uncritical points', \
 

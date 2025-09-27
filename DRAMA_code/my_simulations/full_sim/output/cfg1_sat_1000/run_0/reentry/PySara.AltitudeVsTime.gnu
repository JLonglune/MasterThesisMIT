reset
set datafile separator whitespace
set term png size 960,480

set o 'PySara.AltitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid

set key font ",7"
set key below 
set title 'Altitude vs Time of all Objects'noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' pt 1 ps 3

plot \
'PySara.Compound_of-IFring-PLM-SVM-SolarP.9072898396368480566_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Compound_of-IFring-PLM-SVM.8966457237276172576_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RSJD.a084c8b2-97ee-470d-951a-1bebe0e2085c_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EIU.ff1aaf73-80e2-4d35-8d64-7e51fe643ecf_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RWheel1.63a9fa44-0b0d-449a-a8fd-6346d2c3bd5a_Trajectory.txt' using 1:2 w l lw 3 title 'RWheel1' noenhanced, \
'PySara.RWheel2.245acbc8-c195-45d0-a214-9898b52d5b5c_Trajectory.txt' using 1:2 w l lw 3 title 'RWheel2' noenhanced, \
'PySara.RWheel3.ec3a03ef-52c3-4bf8-b3f8-21ab0025a724_Trajectory.txt' using 1:2 w l lw 3 title 'RWheel3' noenhanced, \
'PySara.SADME.dc7dacaf-0684-4bc3-b79b-30d22b334b96_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.MAC-Y.4254dead-e5a1-4bbf-b2be-57fa9dcc73f6_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.CCU.1064ff79-1d6a-4300-aa63-8768f1fff65c_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BSP.0b78a548-49bc-4f2b-8b9f-999d24c804ae_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.OBA.85e4120f-9a7e-46f5-8a03-355a94c85ec0_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EDR.7312c8c9-199d-4646-8a04-8c0cf69512c6_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EPRM.3d51e22b-0cbb-418c-b31d-4c8cc35d2a61_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.TRSP1.75609b55-cff8-434a-aca2-2286e023e527_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.TRSP2.845a4f95-f1ee-4f2c-a7ce-083967544b8b_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BEG1.9be9abc7-df7e-49fe-9875-83ac0efa312c_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BEG2.744ed77b-395f-4e71-bb4d-25b2479d26c3_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BEG3.8a639930-64e9-49bd-bfb1-92dce15aa113_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BEG4.243185b5-5f9e-4ee9-937d-5570a5ce57e5_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Gyrosbl.ba953c16-e673-4025-a7f3-c6ad8e7b1de0_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.T4S.ef81eb2d-2aa0-42ee-801f-6c9d4f2836fc_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EAIM.4cc46603-5b27-46f7-8342-2ca543cd9976_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.STD1.24b0df56-c1f7-4133-ada3-356713a3920d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.STD2.84d8e60a-8888-4008-98ee-97f86e72405d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SSD1.93c8d32a-05c4-44be-84f6-521d2fe6cda2_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SSD2.cfb2351a-41cc-4000-8a6d-1bd21ea75eb1_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SADM1.bb42edf0-7c27-4377-bfb8-3846f78f70cc_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SADM2.4254b2b9-f0f4-417f-bf3d-c6698423b687_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp1.32a385c5-fe74-4c27-bcd0-f11c244a3638_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp2.15061893-d082-46d0-bfda-0777e9cd0ebc_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp3.3cd65933-bcc4-4e9a-ae62-e9c48afdf238_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp4.1bb09c4b-c061-4ba0-8900-1ee88609ede4_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp5.39749846-e097-4e76-b0de-6e1934ced5f0_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp6.1139e837-8fe7-4a02-a6b7-7be05f1d3a53_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp7.82a9c3bc-6493-40b4-aea1-a7997396f57c_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp8.34af697a-77e1-4fdc-93b8-9b7edeccbaaf_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp9.c4c64e60-9830-4407-9f39-fb29e90abddc_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp10.a748a114-0bd6-4b09-9c66-730036cf0273_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp11.5514313f-1f38-4432-820b-fca6c0a61cbb_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAsupp12.d1f2759f-ad69-4ebf-b09f-811bd8e7c78b_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.CentCone.803466b8-4d34-45ca-a949-95be2cbeeca4_Trajectory.txt' using 1:2 w l lw 3 title 'CentCone' noenhanced, \
'PySara.Ribpanel1.2afd9118-73c5-4eb7-b615-abb3049cce51_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Ribpanel2.e301daf6-984d-4020-b332-fc6d013ef4e7_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Ribpanel3.f2f7d933-69ea-453b-9b26-741165e6ac9c_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Ribpanel4.73442745-d90c-4efb-8b10-a300252b6cfe_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Ribpanel5.2d1ff1e5-d89d-41ec-9b30-c8806caa1207_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BatFloor.7f59d1ba-8c20-48f8-822b-0987db6bca9c_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.IntRing.90350550-8915-4d5e-b55c-e9e1debb8f7f_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PropStr.8973f917-99c6-4f74-9548-8e41755684bf_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Tank1.2077e753-66d3-4062-a24a-191209e524a2_Trajectory.txt' using 1:2 w l lw 3 title 'Tank1' noenhanced, \
'PySara.Tank2.9ab566e6-cbfa-4650-9499-20d42b908d4b_Trajectory.txt' using 1:2 w l lw 3 title 'Tank2' noenhanced, \
'PySara.Tank3.5d20f362-2aeb-42cd-82b8-eb160b897dfc_Trajectory.txt' using 1:2 w l lw 3 title 'Tank3' noenhanced, \
'PySara.Tank4.49f93873-d051-4fd8-bdbd-ed12c1f5b90a_Trajectory.txt' using 1:2 w l lw 3 title 'Tank4' noenhanced, \
'PySara.ValvTran1.dbc90029-7fb7-49aa-9c6b-6640ca879b06_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ValvTran2.1fd2e6b7-29ae-4934-985d-88f9dc6ab417_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ValvTran3.9e2e3edd-c6ff-4395-b236-f1397d754673_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ValvTran4.8929815f-822b-4be9-a995-02edede00917_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ValvTran5.626d0e11-4b55-4e37-bc90-779c9e0c7a9d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ValvTran6.2e574385-7874-4a09-8f1b-ce1803491a4e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery1.7b197b99-20c6-4ffb-82a9-695090eacd9d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery2.e3fbdc10-7494-49e4-884a-2f3ded98e300_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery3.e813dbdf-3048-4bd2-9678-4312889d58fe_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery4.47883bf6-dd97-4ab2-bcb1-a794ee346539_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery5.94bd48c4-b524-41c6-b291-026fc5402459_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Compound_of-IFring-PLM.11448855347680532961_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RSJD-Internal.7390f3ec-208d-4a38-aa7a-e203f648538b_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EIU-Internal.32c03fa3-4d0d-4221-b830-9f6c97bbc5c3_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SADME-internal.785b4d34-1621-4dc9-bd0a-3b3eb1b98309_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.CCU-internal.2b85a500-7e7f-4bc4-b0d9-2b5d1d15a099_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BSP-internal.0311edf9-aed6-4e1b-b434-a28e63dccd64_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EDR-internal.8468837b-aeb0-4b68-bb12-fb2c1a45eb52_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EPRM-internal.a75549bb-2a65-47e2-b257-1605baf8266e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BEG1-internal.99fe0dcd-1415-4a0a-b3eb-40dd782d6f7a_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BEG2-internal.2f01df0a-6250-4783-bcf0-6852a4ec65b7_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BEG3-internal.c26cfc5a-02ff-49ee-aa2d-62a4d1b6e949_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.BEG4-internal.8b5848e9-8173-4940-9a74-480116198686_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.T4S-internal.355d25f9-3965-425f-9261-2577f7f8cb4c_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EAIM-internal.967318a7-0d40-4515-a24b-3278d606c16c_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SADM1_internal.40e2ffab-db50-4f10-af07-844ac3cd46d1_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SADM2-internal.bd3ebba8-c7d0-464c-b530-c81afac9f233_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery1-Internal.092a8729-ea6f-4341-a697-bbcb2fedb72e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery2-Internal.2daf3368-c544-439c-bd01-e97e76d03b91_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery3-Internal.8ca2420a-587c-4058-b976-660e8f862553_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery4-Internal.c0a7c5f8-3291-44a2-9800-1dee3192821d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.Battery5-Internal.0eae4992-9c4c-4b3c-831c-dc7092eb896e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PLM.49858cb8-d8fb-4c9b-82b6-4699f85b8dcf_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.MHS-MPU.71468af4-a456-44d2-960c-c3b22e2dabdf_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.MHS-DBU.82d55923-d2af-4bc8-8582-080753d6bbcb_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATEPC1.3e1a3bf6-0bf1-4091-b46f-932c05131a28_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATEPC2.51ca2e0e-86e5-454d-b0ac-78b4fce6a60f_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATSSP1.1f773a8b-636a-4de4-a9e3-a8750a5df2da_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATSSP2.3f9a62c8-17bf-4f75-8cb7-33a024bd4a65_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATHRS.a8ecbe50-d69a-455f-884a-eae3ec9627e4_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PMC1.8222289f-36de-4e97-98d5-b217f846667a_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PMC2.a917bf4a-b649-489d-9dc4-1adccbcbbd4e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PDU1.0537ea03-4670-49e4-b264-15d92bab84c4_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PDU2.47d1276c-70e2-470f-92e3-ac9845e1d3a7_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RFCU1.dbd74783-15a1-443c-8de9-fe7771b14ec6_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RFCU2.185ca8fd-00f8-4470-b37e-a82dc41765b1_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RFCU3.46348f4c-bc26-436c-86cd-62d76e5e8b9c_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RFCU4.9a74d245-1fe6-47c6-8390-ac3850e71522_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RFCU5.b7af6d3b-f412-401d-a39e-3d3ee5042bed_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RTU.5cd3572a-3218-4658-8521-d9804ced1e9f_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SLAFilt.55158c9a-f9c5-46aa-b602-d9cb5984c466_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SARP-3.d7bd5c03-f80b-461b-8af7-657d9b05204d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAR-Rx.636de29e-d481-433b-81dd-49c440d46a45_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAR-Tx.0811b25c-271f-4575-abd0-1c7da3798136_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EPC1.56e696f8-ec3c-413e-af35-7ceec8bc2365_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.EPC2.c447122c-bb20-4315-8121-0a35700a3f6b_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.MOD1.b3430ea6-7c48-4042-b5f7-b07cf49a6371_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.MOD2.764ed056-8ce5-453c-8896-d451c5c44659_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.TWT1.684341d6-8ce2-4055-a592-2fc9912ddf09_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.TWT2.35deacb2-c6a2-4f16-9e55-d44813b8a93a_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SRADipl.59ad043a-c762-4a65-98ae-7fd1e356775b_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.LNA1.844d48f4-13ed-41a6-a555-1762db662628_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.LNA2.fb9bdf80-e01b-4119-82cd-9d5a43b3ba67_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.UDAFilt.2ef56939-a9fc-4def-8d3d-5b6385a5e759_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.DBU1.e97d8292-02e8-4acb-a634-7dd2c2fffcdc_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.DBU2.a658498f-41e2-4a69-8ea7-23934bdcd7a6_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.DBU3.b3dcc589-abc9-4d4c-bf07-3b75ead42d7f_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.DBU4.41ce2e65-39a8-49bf-8ddd-e30dc1baf678_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.DBU5.624e2806-adea-4308-b504-c4449bc97479_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATRFU1.0aa8a2c0-ec39-42e6-8da8-bc6cc699c606_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATRFU2.47f10662-ff1d-49f1-a914-6c3ea10deb35_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.IASI-DPS.a53c29ba-6b71-4132-8edf-b7039bd44ad2_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RFCU.5b86f470-44a4-4ec5-8273-5d7df1eab50e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.IASI-IMS.da26e55e-0c11-45ad-8d3d-66652dd3723e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.DPU-SEM.689791a9-de13-4150-8f6a-c50e8cb6905a_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PCU.8f88f259-d6cf-4443-9cd6-698aef3f1114_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.TCU.ec89d4c6-20df-4070-b733-9f1552d41c7e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.FMU1.78d80f1c-9104-4af6-b066-9c57e7bbd415_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.FMU2.d863747a-495a-45c4-abb1-ad00abd36e8d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SSR.04515579-e5af-4cce-9bd7-ef29afced2c5_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.NIU.bbc60374-ca13-4662-867d-3772cca49cf8_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.L-SSPA1.2424cd89-ade8-40c4-baae-7b5d2bec50b0_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.L-SSPA2.317de540-f756-4ea1-929a-778f9cecc003_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.LH-MOD1.f9be32d6-1e7d-4319-bee1-3f5b3dd21cd0_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.LH-MOD2.dd837854-f8fc-4075-9230-b0761a98bc37_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.H-SSPA1.f29a83d7-5acb-4d9e-a2bb-5c9f9fd86e39_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.H-SSPA2.bf96a4c3-9391-4af4-8dab-12202b581e79_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ADCS-RPU.46bd662e-534d-4e92-a802-86a723e35b28_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ADCS-TXU.42ac1896-26e7-4c09-a918-9352b410a3d4_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.GRAS-GEU.87b8b918-9136-4203-8607-2a5c00b784eb_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATICU1.5bd35b65-7560-4add-bf7b-7f7884f60c85_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATICU2.8b9a26a2-5611-4800-b2a7-2fdee0561470_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATDPU1.8078c3b2-2ac0-46a1-9d10-533e9ee10349_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATDPU2.321236b2-de49-48ed-ba93-5fa72bcea46d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.IASI.6ec8e3b0-bee6-4571-99e4-bf462d5ab672_Trajectory.txt' using 1:2 w l lw 3 title 'IASI' noenhanced, \
'PySara.Cylind1.baa15345-588e-44f0-ae31-4e212aae8951_Trajectory.txt' using 1:2 w l lw 3 title 'Cylind1' noenhanced, \
'PySara.Cylind2.605f092a-c977-44bd-953f-0bb289c43b86_Trajectory.txt' using 1:2 w l lw 3 title 'Cylind2' noenhanced, \
'PySara.SheWallY1.dfab742f-f17a-4a69-b9af-67dfbb5cc42b_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SheWallY2.3f2c9faa-32b9-466a-bf55-717d32340370_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SheWallY3.49d1d881-cbd7-417c-982e-beb945e16ed9_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SheWallY4.f0764e62-6c01-443b-8d63-5866b980f201_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SheWallZ1.9490e285-fb49-4468-83f5-189d67ebfe4f_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SheWallZ2.b91d1f69-b1e4-4d75-9a01-a0a5a2076627_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.MHS-MPU-internal.447423fa-5f0b-40e3-b666-220ec69fa332_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATEPC1-internal.f069725d-6586-4eb6-bd1c-0315d34d9303_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATEPC2-internal.a933ab03-015e-441f-b11a-b091ee871152_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PMC1-internal.ef40a46d-285a-4d76-8294-d9a8654b175e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PMC2-internal.7045d526-77ef-4590-abce-cd9e9c3af708_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PDU1-internal.b518d4fd-73f0-47f8-86c4-86e6cd94d59a_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PDU2-internal.a4a3761c-bce1-43f7-adef-540c95a96cac_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.RTU-internal.5fcb2380-1d60-4ce0-bcbb-10b1e00c4e0d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SARP-3-internal.e458bd60-f127-4009-afdd-1f540e3b5ea4_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SAR-Rx-internal.6e1e7d38-4eaf-4260-a8f5-e56329fb164d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATRFU1-internal.a117e6ac-780b-4570-a984-cd86a89ae753_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATRFU2-internal.270c649e-99f8-4ead-ac01-76bf1a99cc4b_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.IASI-DPS-internal.2501fa19-3f92-4112-814c-f82417561371_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.IASI-IMS-internal.1721dc2a-90bb-45c0-986b-843875808151_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.DPU-SEM-internal.81da4b10-3199-4fc2-9f4e-a7977fcfe438_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.PCU-internal.25d4c5dd-be9f-44b8-9620-4258c3b44b3f_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.TCU-internal.3831342f-7250-40c5-994b-3f3064440376_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.SSR-internal.1ee7b59e-98d1-4ffc-b50c-f9b87172578e_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.NIU-internal.6bf9e2de-89f5-4ecb-9051-4a6d99c869a2_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ADCS-RPU-internal.03edc3be-cf19-481c-9863-89be7cb55690_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ADCS-TXU-internal.9e3886d4-bad7-4320-8208-1f9b0d6f5025_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.GRAS-GEU-internal.c74fc376-15a8-41a4-b5f0-5bee1fbc396a_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATDPU1-internal.3ae36069-a012-4c39-a158-39707a52ed5d_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.ASCATDPU2-internal.3b0cb819-0163-494a-9047-b8802a67ab90_Trajectory.txt' using 1:2 w l lw 1 title '', \
'PySara.demiseData.txt' using 1:2 w p ls 1 lw 3 title 'Demise points', \
'PySara.ballooningData.txt' using 1:2 w p ls 2 lw 3 title 'Ballooning points', \
'PySara.uncriticalData.txt' using 1:2 w p ls 4 lw 3 title 'Uncritical points', \
 

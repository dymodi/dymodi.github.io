---
layout: single
title: "Publications"
permalink: /publications/
author_profile: true
classes: wide
---

<!-- publications.md -->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publications</title>
    <link rel="stylesheet" href="style.css">
    <style>
    .tag {
        display: inline-block;
        padding: 0px 7px;
        border-radius: 8px;
        font-size: 0.75em;
        font-weight: 600;
        white-space: nowrap;
    }
    .tag-sms      { background-color: #dbeafe; color: #1e40af; border: 1px solid #93c5fd; }
    .tag-sms-ai   { background-color: #d1fae5; color: #065f46; border: 1px solid #6ee7b7; }
    .tag-ai-sms   { background-color: #ede9fe; color: #4c1d95; border: 1px solid #c4b5fd; }
    .tag-mdm      { background-color: #fef3c7; color: #92400e; border: 1px solid #fcd34d; }
    .tag-embodied { background-color: #fee2e2; color: #991b1b; border: 1px solid #fca5a5; }

    .tag-legend {
        font-size: 0.82em;
        margin-bottom: 1.2em;
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        padding: 8px 12px;
        display: inline-block;
        background: #fafafa;
    }
    .tag-legend-row {
        display: flex;
        align-items: baseline;
        margin: 3px 0;
        gap: 8px;
    }
    .tag-legend-row .tag {
        flex-shrink: 0;
        font-size: 0.88em;
    }
    .tag-legend-desc {
        color: #444;
    }

    .pub-list {
        font-size: 0.93em;
        list-style: disc;
        padding-left: 1.5em;
    }
    .pub-list li {
        margin-bottom: 1em;
        line-height: 1.5;
    }
    .pub-tag-line {
        display: block;
        margin: 2px 0 3px 0;
    }
    </style>
</head>
<body>
    <p>This page summarizes my publications in wireless sensing &amp; mobile computing systems, AI for sensing &amp; mobile systems, mobile data mining, and embodied AI. I mainly publish at top conferences like NSDI, SIGCOMM, MobiCom, IMWUT/UbiComp, RTSS, KDD, WWW, and ACM/IEEE Transactions. Authors with * are students working primarily with me.</p>

    <div class="tag-legend">
        <div class="tag-legend-row"><span class="tag tag-sms">Sensing &amp; Mobile Systems</span><span class="tag-legend-desc">Building and deploying sensing/mobile systems where AI is not a primary contribution.</span></div>
        <div class="tag-legend-row"><span class="tag tag-sms-ai">Sensing &amp; Mobile Systems with AI</span><span class="tag-legend-desc">Systems where AI is an integral component, with system design as the primary contribution.</span></div>
        <div class="tag-legend-row"><span class="tag tag-ai-sms">AI for Sensing &amp; Mobile Systems</span><span class="tag-legend-desc">Novel AI/ML model or algorithm for sensing, perception, or mobile computing.</span></div>
        <div class="tag-legend-row"><span class="tag tag-mdm">Mobile Data Mining</span><span class="tag-legend-desc">Data-driven analysis, prediction, and knowledge discovery from large-scale mobile and spatial-temporal datasets.</span></div>
        <div class="tag-legend-row"><span class="tag tag-embodied">Embodied AI</span><span class="tag-legend-desc">Autonomous systems that sense and act in the physical world, including UAVs and robotic platforms.</span></div>
    </div>

    <ul class="pub-list">

        <li><span style="color:Red">[arXiv'26]</span> <b>WM-DAgger: Enabling Efficient Data Aggregation for Imitation Learning with World Models</b>
            <span class="pub-tag-line"><span class="tag tag-embodied">Embodied AI</span></span>
            Anlan Yu*, Zaishu Chen, Peili Song, Zhiqing Hong, Haotian Wang, Desheng Zhang, Tian He, <b>Yi Ding</b>, Daqing Zhang
            <br><i>arXiv preprint arXiv:2604.11351, 2026</i>
            <br>[<a href="https://arxiv.org/abs/2604.11351">arXiv</a>]
        </li>

        <li><span style="color:Goldenrod">[WWW'26]</span> <b>Predictability-Aware Compression and Decompression Framework for Multichannel Time Series Data</b>
            <span class="pub-tag-line"><span class="tag tag-ai-sms">AI for Sensing &amp; Mobile Systems</span></span>
            Ziqi Liu*, Pei Zeng*, <b>Yi Ding</b>
            <br><i>Proceedings of the ACM on the Web Conference 2026</i>
            <br>[<a href="https://arxiv.org/pdf/2506.00614">PDF</a>]
        </li>

        <li><span style="color:DarkGreen">[IMWUT'25/UbiComp'26]</span> <b>Large Language Model-Guided Semantic Alignment for Human Activity Recognition</b>
            <span class="pub-tag-line"><span class="tag tag-ai-sms">AI for Sensing &amp; Mobile Systems</span></span>
            Hua Yan, Heng Tan, <b>Yi Ding</b>, Pengfei Zhou, Vinod Namboodiri, Yu Yang
            <br><i>Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies, 2025</i>
            <br>[<a href="https://dl.acm.org/doi/epdf/10.1145/3770652">PDF</a>]
        </li>

        <li><span style="color:RoyalBlue">[MobiCom'25]</span> <b>Experience Paper: Nationwide Human Behavior Sensing in Last-mile Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-sms-ai">Sensing &amp; Mobile Systems with AI</span></span>
            Zhiqing Hong, Weibing Wang, Anlan Yu, Shuxin Zhong, Haotian Wang, <b>Yi Ding</b>, Tian He, Desheng Zhang
            <br><i>Proceedings of the 31st Annual International Conference on Mobile Computing And Networking</i>
            <br>[<a href="https://dl.acm.org/doi/epdf/10.1145/3680207.3765239">PDF</a>]
        </li>

        <li><span style="color:RoyalBlue">[MobiCom'25]</span> <b>Auto-UIT: Automated UAV Inspection Trajectory Generation from Noisy Sparse 3D Point Cloud</b>
            <span class="pub-tag-line"><span class="tag tag-embodied">Embodied AI</span></span>
            Feng Lyu, Lijuan He, Mingliu Liu, Sijing Duan, Hao Wu, Jieyu Zhou, <b>Yi Ding</b>, Zaixun Ling, Yibo Cui
            <br><i>Proceedings of the 31st Annual International Conference on Mobile Computing And Networking</i>
            <br>[<a href="https://dl.acm.org/doi/epdf/10.1145/3680207.3765244">PDF</a>]
        </li>

        <li><span style="color:RoyalBlue">[FMSys'25]</span> <b>Are We There Yet? A Measurement Study of Efficiency for LLM Applications on Mobile Devices</b>
            <span class="pub-tag-line"><span class="tag tag-sms-ai">Sensing &amp; Mobile Systems with AI</span></span>
            Xiao Yan*, <b>Yi Ding</b>
            <br><i>The 2nd International Workshop on Foundation Models for Cyber-Physical Systems &amp; Internet of Things</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3722565.3727192">PDF</a>]
        </li>

        <li><span style="color:Goldenrod">[PerCom'25]</span> <b>FineSat: Enhancing GNSS Signals for High-precision Sensing</b>
            <span class="pub-tag-line"><span class="tag tag-sms">Sensing &amp; Mobile Systems</span></span>
            Anlan Yu*, Xuanzhi Wang, Pei Wang, Jinkun Li, Xujun Ma, Zhiqing Hong, Haotian Wang, <b>Yi Ding</b>, Daqing Zhang
            <br><i>2025 IEEE International Conference on Pervasive Computing and Communications</i>
        </li>

        <li><span style="color:SteelBlue">[TMC'25]</span> <b>Exploring Cellular User Re-Identification Risks with Networking Behaviors Analysis and Modeling</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Sijing Duan, Feng Lyu, Shanshan Wang, <b>Yi Ding</b>, Xiaohao He, Yaoxue Zhang
            <br><i>IEEE Transactions on Mobile Computing, 2025</i>
        </li>

        <li><span style="color:DarkBlue">[CIKM'25]</span> <b>Fraudulent Delivery Detection with Multimodal Courier Behavior Data in Last-Mile Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Shanshan Wang*, Sijing Duan, Shuxin Zhong, Zhiqing Hong, Zhiyuan Zhou, Hongyu Lin, Weijian Zuo, Desheng Zhang, <b>Yi Ding</b>
            <br><i>34th ACM International Conference on Information and Knowledge Management</i>
            <br>[<a href="https://dl.acm.org/doi/epdf/10.1145/3746252.3761560">PDF</a>]
        </li>

        <li><span style="color:Navy">[KDD'25]</span> <b>LLM4HAR: Generalizable On-device Human Activity Recognition with Pretrained LLMs</b>
            <span class="pub-tag-line"><span class="tag tag-ai-sms">AI for Sensing &amp; Mobile Systems</span></span>
            Zhiqing Hong, Yiwei Song, Zelong Li, Anlan Yu, Shuxin Zhong, <b>Yi Ding</b>, Tian He, Desheng Zhang
            <br><i>Proceedings of the 31st ACM SIGKDD Conference on Knowledge Discovery and Data Mining</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3711896.3737226">PDF</a>]
        </li>

        <li><span style="color:Goldenrod">[WWW'25]</span> <b>InCo: Exploring Inter-Trip Cooperation for Efficient Last-mile Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Wenjun Lyu, Shuxin Zhong, Guang Yang, Haotian Wang, <b>Yi Ding</b>, Shuai Wang, Yunhuai Liu, Tian He, Desheng Zhang
            <br><i>Proceedings of the ACM on the Web Conference 2025</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3696410.3714483">PDF</a>]
        </li>

        <li><span style="color:DarkGreen">[IMWUT/UbiComp'24]</span> <b>CrossHAR: Generalizing Cross-dataset Human Activity Recognition via Hierarchical Self-Supervised Pretraining</b>
            <span class="pub-tag-line"><span class="tag tag-ai-sms">AI for Sensing &amp; Mobile Systems</span></span>
            Zhiqing Hong, Zelong Li, Shuxin Zhong, Wenjun Lyu, Haotian Wang, <b>Yi Ding</b>, Tian He, Desheng Zhang
            <br><i>Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3659597">PDF</a>]
        </li>

        <li><span style="color:DarkBlue">[CIKM'24]</span> <b>Behavior-Aware Hypergraph Convolutional Network for Illegal Parking Prediction with Multi-Source Contextual Information</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Guang Yang*, Meiqi Tu, Zelong Li, Jinquan Hang, Taichi Liu, Ruofeng Liu, <b>Yi Ding</b>, Yu Yang, Desheng Zhang
            <br><i>33rd ACM International Conference on Information and Knowledge Management</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3627673.3679563">PDF</a>]
        </li>

        <li><span style="color:DeepPink">[TKDE'24]</span> <b>Nationwide Behavior-Aware Coordinates Mining from Uncertain Delivery Events</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Zhiqing Hong, Guang Wang, Wenjun Lyu, Baoshen Guo, <b>Yi Ding</b>, Haotian Wang, Shuai Wang, Yunhuai Liu, Desheng Zhang
            <br><i>IEEE Transactions on Knowledge and Data Engineering</i>
            <br>[<a href="https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=10552380">PDF</a>]
        </li>

        <li><span style="color:DarkGreen">[IMWUT/UbiComp'24]</span> <b>SmallMap: Low-cost Community Road Map Sensing with Uncertain Delivery Behavior</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Zhiqing Hong, Haotian Wang, <b>Yi Ding</b>, Guang Wang, Tian He, Desheng Zhang
            <br><i>Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3659596">PDF</a>]
        </li>

        <li><span style="color:DarkBlue">[VLDB'23]</span> <b>VeLP: Vehicle Loading Plan Learning from Human Behavior in Nationwide Logistics System</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Sijing Duan, Feng Lyu, Xin Zhu, <b>Yi Ding</b>, Haotian Wang, Desheng Zhang, Xue Liu, Yaoxue Zhang, Ju Ren
            <br><i>Proceedings of the VLDB Endowment</i>
            <br>[<a href="https://www.vldb.org/pvldb/vol17/p241-duan.pdf">PDF</a>]
        </li>

        <li><span style="color:SteelBlue">[TMC'23]</span> <b>Time-Constrained Actor-Critic Reinforcement Learning for Concurrent Order Dispatch in On-demand Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Shuai Wang, Baoshen Guo, <b>Yi Ding</b>, Guang Wang, Suining He, Desheng Zhang, Tian He
            <br><i>IEEE Transactions on Mobile Computing, 2023</i>
        </li>

        <li><span style="color:SteelBlue">[ToSN'23]</span> <b>OPTI: Order Preparation Time Inference for On-demand Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Zhigang Dai, Wenjun Lyu, <b>Yi Ding</b>, Yiwei Song, Yunhuai Liu
            <br><i>ACM Transactions on Sensor Networks, 2023</i>
        </li>

        <li><span style="color:SteelBlue">[ToN'22]</span> <b>Nationwide Deployment and Operation of a Virtual Arrival Detection System in the Wild</b>
            <span class="pub-tag-line"><span class="tag tag-sms">Sensing &amp; Mobile Systems</span></span>
            <b>Yi Ding</b>, Yu Yang, Wenchao Jiang, Yunhuai Liu, Tian He, Desheng Zhang
            <br><i>IEEE/ACM Transactions on Networking, 2022</i>
        </li>

        <li><span style="color:RoyalBlue">[MobiCom'22]</span> <b>Experience: Adopting Indoor Outdoor Detection in On-demand Food Delivery Business</b>
            <span class="pub-tag-line"><span class="tag tag-sms">Sensing &amp; Mobile Systems</span></span>
            Pengfei Zhou, <b>Yi Ding</b>, Yang Li, Mo Li, Guobin Shen, Tian He
            <br><i>Proceedings of the 28th Annual International Conference on Mobile Computing And Networking</i>
            <br>[<a href="https://wands.sg/publications/full_list/papers/MobiCom_22_1.pdf">PDF</a>]
        </li>

        <li><span style="color:DarkGreen">[IMWUT/UbiComp'22]</span> <b>WePos: Weak-supervised Indoor Positioning with Unlabeled WiFi for On-demand Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-sms-ai">Sensing &amp; Mobile Systems with AI</span></span>
            Baoshen Guo, Weijian Zuo, Shuai Wang, Wenjun Lyu, Zhiqing Hong, <b>Yi Ding</b>, Tian He, Desheng Zhang
            <br><i>Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3534574">PDF</a>]
        </li>

        <li><span style="color:DarkGreen">[IMWUT/UbiComp'22]</span> <b>P2-Loc: A Person-2-Person Indoor Localization System in On-Demand Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-sms-ai">Sensing &amp; Mobile Systems with AI</span></span>
            <b>Yi Ding</b>, Dongzhe Jiang, Yu Yang, Yunhuai Liu, Tian He, Desheng Zhang
            <br><i>Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3517238">PDF</a>] [<a href="https://tianchi.aliyun.com/dataset/dataDetail?dataId=119097">Dataset</a>] [<a href="https://github.com/dymodi/P2Loc">Code</a>]
        </li>

        <li><span style="color:DarkGreen">[IMWUT/UbiComp'22]</span> <b>SmartLOC: Indoor Localization with Smartphone Anchors for On-Demand Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-sms-ai">Sensing &amp; Mobile Systems with AI</span></span>
            <b>Yi Ding</b>, Dongzhe Jiang, Yunhuai Liu, Desheng Zhang, Tian He
            <br><i>Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3494972">PDF</a>] [<a href="https://github.com/dymodi/SmartLOC">Code</a>]
        </li>

        <li><span style="color:DarkBlue">[SIGSPATIAL'22]</span> <b>CoMiner: Nationwide Behavior-driven Unsupervised Spatial Coordinate Mining from Uncertain Delivery Events</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Zhiqing Hong, Guang Wang, Wenjun Lyu, Baoshen Guo, <b>Yi Ding</b>, Haotian Wang, Shuai Wang, Yunhuai Liu, Desheng Zhang
            <br><i>Proceedings of the 30th International Conference on Advances in Geographic Information Systems</i>
            <br>[<a href="https://www.dropbox.com/s/qqkg1szfrdzy6in/paper_37.pdf?dl=0">PDF</a>]
        </li>

        <li><span style="color:Navy">[KDD'22]</span> <b>Para-Pred: Addressing Heterogeneity for City-Wide Indoor Status Estimation in On-Demand Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-ai-sms">AI for Sensing &amp; Mobile Systems</span></span>
            Wei Liu+, <b>Yi Ding+</b>, Shuai Wang, Yu Yang, Desheng Zhang (+ = equal contribution)
            <br><i>Proceedings of the 28th ACM SIGKDD Conference on Knowledge Discovery and Data Mining</i>
            <br>195/753=26%
            <br>[<a href="https://yi-ding.me/assets/files/Publications/Para-Pred.pdf">PDF</a>]
        </li>

        <li><span style="color:SteelBlue">[ToN'21]</span> <b>From Conception to Retirement: a Lifetime Story of a 3-Year-Old Operational Wireless Beacon System in the Wild</b>
            <span class="pub-tag-line"><span class="tag tag-sms">Sensing &amp; Mobile Systems</span></span>
            <b>Yi Ding</b>, Ling Liu, Yu Yang, Yunhuai Liu, Desheng Zhang, Tian He
            <br><i>IEEE/ACM Transactions on Networking, 2021</i>
        </li>

        <li><span style="color:FireBrick">[SIGCOMM'21]</span> <b>Nationwide Deployment and Operation of a Virtual Arrival Detection System in the Wild</b>
            <span class="pub-tag-line"><span class="tag tag-sms">Sensing &amp; Mobile Systems</span></span>
            <b>Yi Ding</b>, Yu Yang, Wenchao Jiang, Yunhuai Liu, Tian He, Desheng Zhang
            <br><i>Proceedings of the 2021 ACM SIGCOMM Conference</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3452296.3472911">PDF</a>] [<a href="https://tianchi.aliyun.com/dataset/dataDetail?dataId=103969">Dataset</a>] 55/241=23%
        </li>

        <li><span style="color:Red">[NSDI'21]</span> <b>From Conception to Retirement: a Lifetime Story of a 3-Year-Old Operational Wireless Beacon System in the Wild</b>
            <span class="pub-tag-line"><span class="tag tag-sms">Sensing &amp; Mobile Systems</span></span>
            <b>Yi Ding</b>, Ling Liu, Yu Yang, Yunhuai Liu, Tian He, Desheng Zhang
            <br><i>Proceedings of the 18th USENIX Symposium on Networked Systems Design and Implementation</i>
            <br>[<a href="https://www.usenix.org/system/files/nsdi21spring-ding.pdf">PDF</a>] [<a href="https://tianchi.aliyun.com/dataset/dataDetail?dataId=76359">Dataset</a>] [<a href="https://www.youtube.com/watch?v=PV9MUVwGw8o">Video</a>] 19/114=16%
        </li>

        <li><span style="color:SteelBlue">[RTSS'21]</span> <b>Concurrent Order Dispatch for Instant Delivery with Time-Constrained Actor-Critic Reinforcement Learning</b>
            <span class="pub-tag-line"><span class="tag tag-sms-ai">Sensing &amp; Mobile Systems with AI</span></span>
            Baoshen Guo, Shuai Wang, <b>Yi Ding</b>, Guang Wang, Suining He, Desheng Zhang, Tian He
            <br><i>2021 IEEE Real-Time Systems Symposium (RTSS)</i>
            <br>[<a href="https://uconnuclab.github.io/publications/2021/Conference/guo-rtss-2021.pdf">PDF</a>] <span style="background-color:red;color:White">&nbsp;Outstanding Paper Award&nbsp;</span>
        </li>

        <li><span style="color:DarkGreen">[IMWUT/UbiComp'21]</span> <b>ALWAES: an Automatic Outdoor Location-Aware Correction System for Online Delivery Platforms</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Dongzhe Jiang, <b>Yi Ding</b>, Hao Zhang, Yunhuai Liu, Tian He, Yu Yang, Desheng Zhang
            <br><i>Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3478081">PDF</a>] [<a href="https://tianchi.aliyun.com/dataset/dataDetail?dataId=107267">Dataset</a>]
        </li>

        <li><span style="color:DarkGreen">[IMWUT/UbiComp'21]</span> <b>A City-Wide Crowdsourcing Delivery System with Reinforcement Learning</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            <b>Yi Ding</b>, Baoshen Guo, Lin Zheng, Mingming Lu, Desheng Zhang, Shuai Wang, Sang Hyuk Son, Tian He
            <br><i>Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies</i>
            <br>[<a href="https://dl.acm.org/doi/pdf/10.1145/3478117">PDF</a>] [<a href="https://tianchi.aliyun.com/dataset/dataDetail?dataId=106807">Dataset</a>]
        </li>

        <li><span style="color:RoyalBlue">[MobiCom'20]</span> <b>TransLoc: Transparent Indoor Localization with Uncertain Human Participation</b>
            <span class="pub-tag-line"><span class="tag tag-sms">Sensing &amp; Mobile Systems</span></span>
            Yu Yang, <b>Yi Ding</b>, Dengpan Yuan, Guang Wang, Xiaoyang Xie, Yunhuai Liu, Tian He, Desheng Zhang
            <br><i>Proceedings of the 26th Annual International Conference on Mobile Computing and Networking</i>
            <br>[<a href="https://www.yyang.site/assets/pub/transloc.pdf">PDF</a>] 63/384=16%
        </li>

        <li><span style="color:DarkGreen">[IMWUT/UbiComp'19]</span> <b>Route Prediction for Instant Delivery</b>
            <span class="pub-tag-line"><span class="tag tag-mdm">Mobile Data Mining</span></span>
            Yan Zhang, Yunhuai Liu, <b>Yi Ding</b>, Genjian Li, Ning Chen, Hao Zhang, Tian He, Desheng Zhang
            <br><i>Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies</i>
            <br>[<a href="https://static.aminer.cn/upload/pdf/804/626/236/5d77773b47c8f76646d17f1f_0.pdf">PDF</a>]
        </li>

    </ul>
</body>
</html>

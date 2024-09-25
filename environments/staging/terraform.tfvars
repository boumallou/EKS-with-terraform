environment = "staging"
octnis_app_name = "octnis"
baymax_app_name = "Baymax"
octnis_instance_size ="t3a.medium"
baymax_instance_size = "t2.micro"
octnis_key_name = "junejie"
baymax_key_name = "junejie"
octnis_certificat_arn = "arn:aws:acm:ap-southeast-1:679729933261:certificate/04b407ac-4ea1-4080-aa2a-834ca3b050ac" // domain *.staging.uws-tech.com
//HostedZoneId_staging_uws-tech = "Z05380279RP09SIUIBA2" // hosted zone staging.uws-tech.com
Octnis_record_name = "octnis.staging.uws-tech.com"
bucketnames = ["staging-claims.april.asia", #Index 0
                "staging-myhealth-hk.april.asia", #Index 1
                "staging-mybusinesstravel.april-international.com", #Index 2
                "staging-myhealth-sg.april.asia", #Index 3
                "staging-myhealth-th.april.asia", #Index 4
                "staging-myhealth-vn.april.asia", #Index 5
                "staging1-axa.uexglobal.com", #Index 6
                "staging-backoffice.uexglobal.com", #Index 7
                "staging-business.uexglobal.com", #Index 8
                "staging-maintenance.uexglobal.com", #Index 9
                "staging-maintenance.uws-tech.com", #Index 10
                "staging1-mhf.april-international.com", #Index 11
                "staging1-myhealthfrance.april-international.com", #Index12
                "staging1-myhealth-du.april-international.com", #Index13
                "staging1-myhealth-dubai.april-international.com", #Index14
                "staging1-myhealth-hk.april-international.com", #Index15
                "staging1-myhealth-hongkong.april-international.com", #Index16
                "staging-masante.april-entreprise.com", #Index17
                "staging1-myhealth-sg.april-international.com", #Index18
                "staging1-myhealth-singapore.april-international.com", #Index19
                "staging1-myhealth-th.april-international.com", #Index20
                "staging1-myhealth-thailand.april-international.com", #Index21
                "staging1-myhealth-vn.april-international.com", #Index22
                "staging1-myhealth-vietnam.april-international.com", #Index23
                "staging-axa-payment.uexglobal.com", #Index24
                "staging1-long-term.april-international.com", #Index25"
                "staging1-mhi.april-international.com", #Index26
                "staging1-myhealthinternational.april-international.com", #Index27
                "staging1-mtc.april-international.com", #Index28
                "staging1-mytempocover.april-international.com", #Index29
                "staging1-admin-nis.april.asia", #Index30
                "staging1-myapril-business.april-international.com", #Index31
                "staging1-myapril.april-international.com", #Index32
                "staging1-producer.april.asia", #Index33
                "staging1-producer.april-international.com", #Index34
                "staging1-provider.april.asia", #Index35
                "staging-short-term.april-international.com", #Index36
                "staging-redirection-legacy.uexglobal.com", #Index37
                "staging-myhealth-sg.uexglobal.com", #Index38
                "staging1-docs.uexglobal.com", #Index39
                "staging1-euw3.docs.uexglobal.com", #Index40
                "staging-uexglobal.com", #Index41
                "baymax-logs-staging1-asia", #Index42
                "baymax-logs-staging-euw3", #Index43
                "staging-baymax-deployment-asia.uexglobal.com", #Index44
                "staging-baymax-deployment-eu.uexglobal.com", #Index45
                "staging1.asia.product-administration", #Index46
                "staging.euw3.product-administration", #Index47
                "staging-octnis-deployment-asia.uexglobal.com", #Index48
                "staging-admin-vpc-utilities", #Index49
                "staging-ssh-private-keys", #Index50
                "octnis-staging1", #Index51
                "staging-axa-pay.uexglobal.com" #Index5
              ]



Octnis_eks_cluster_name = "octnis-cluster"

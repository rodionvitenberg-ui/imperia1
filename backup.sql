--
-- PostgreSQL database dump
--

\restrict z7XKe8RuDcBuCsm2q5EbekbnlTbNMHKlRP6Oq8rwZChii9maBQbMXiwEs4E25cs

-- Dumped from database version 17.10 (Ubuntu 17.10-0ubuntu0.25.10.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.products_warranty DROP CONSTRAINT IF EXISTS products_warranty_product_id_51395474_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_stock DROP CONSTRAINT IF EXISTS products_stock_variant_id_dc51ed5d_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_stock DROP CONSTRAINT IF EXISTS products_stock_product_id_170f916b_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_reviewimage DROP CONSTRAINT IF EXISTS products_reviewimage_review_id_c90b3860_fk_products_review_id;
ALTER TABLE IF EXISTS ONLY public.products_review DROP CONSTRAINT IF EXISTS products_review_product_id_d933ffa7_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_review DROP CONSTRAINT IF EXISTS products_review_customer_id_54220657_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_products DROP CONSTRAINT IF EXISTS products_promotionbl_promotionblock_id_e5dfe04c_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_categories DROP CONSTRAINT IF EXISTS products_promotionbl_promotionblock_id_dadbd43e_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_products DROP CONSTRAINT IF EXISTS products_promotionbl_product_id_ea5f3c1a_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_categories DROP CONSTRAINT IF EXISTS products_promotionbl_category_id_80df819f_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productvideo DROP CONSTRAINT IF EXISTS products_productvide_product_id_872fe729_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productvariant DROP CONSTRAINT IF EXISTS products_productvari_product_id_d9c22902_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productimage DROP CONSTRAINT IF EXISTS products_productimag_variant_id_bf70ade8_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productimage DROP CONSTRAINT IF EXISTS products_productimag_product_id_e747596a_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS products_productattr_variant_id_e4b8d9e4_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS products_productattr_product_id_b9a86828_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS products_productattr_attribute_id_de00002b_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_product_feature_tags DROP CONSTRAINT IF EXISTS products_product_feature_tags_tag_id_fkey;
ALTER TABLE IF EXISTS ONLY public.products_product_feature_tags DROP CONSTRAINT IF EXISTS products_product_feature_tags_product_id_fkey;
ALTER TABLE IF EXISTS ONLY public.products_product_categories DROP CONSTRAINT IF EXISTS products_product_cat_product_id_50ef8156_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_product_categories DROP CONSTRAINT IF EXISTS products_product_cat_category_id_27982bed_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_product_brands DROP CONSTRAINT IF EXISTS products_product_brands_brand_id_283aac29_fk_products_brand_id;
ALTER TABLE IF EXISTS ONLY public.products_product_brands DROP CONSTRAINT IF EXISTS products_product_bra_product_id_e551c83f_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_pricehistory DROP CONSTRAINT IF EXISTS products_pricehistor_variant_id_7a8d8d2e_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_pricehistory DROP CONSTRAINT IF EXISTS products_pricehistor_product_id_1fc0e3fe_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_variant_id_0ab210d0_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_promo_campaign_id_22319ff1_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_product_id_c39a20cb_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_category_id_7f843ced_fk_products_category_id;
ALTER TABLE IF EXISTS ONLY public.products_certificate DROP CONSTRAINT IF EXISTS products_certificate_product_id_7564eb6b_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_category DROP CONSTRAINT IF EXISTS products_category_parent_id_3388f6c9_fk_products_category_id;
ALTER TABLE IF EXISTS ONLY public.products_category_brands DROP CONSTRAINT IF EXISTS products_category_brands_brand_id_fc34923b_fk_products_brand_id;
ALTER TABLE IF EXISTS ONLY public.products_category_brands DROP CONSTRAINT IF EXISTS products_category_br_category_id_f3697e5d_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_category_attributes DROP CONSTRAINT IF EXISTS products_category_at_category_id_bf20cdc7_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_category_attributes DROP CONSTRAINT IF EXISTS products_category_at_attribute_id_4cd0be2e_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_tags DROP CONSTRAINT IF EXISTS products_blogpost_tags_tag_id_195753d7_fk_products_tag_id;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_tags DROP CONSTRAINT IF EXISTS products_blogpost_ta_blogpost_id_413833f9_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_related_products DROP CONSTRAINT IF EXISTS products_blogpost_re_product_id_de7a3b9d_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_related_products DROP CONSTRAINT IF EXISTS products_blogpost_re_blogpost_id_8b6639e4_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_blogpost DROP CONSTRAINT IF EXISTS products_blogpost_author_id_567d983f_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.products_banner DROP CONSTRAINT IF EXISTS products_banner_category_id_6ffcde53_fk_products_category_id;
ALTER TABLE IF EXISTS ONLY public.notifications_notificationlog DROP CONSTRAINT IF EXISTS notifications_notifi_order_id_275e19e6_fk_customers;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.customers_wishlist DROP CONSTRAINT IF EXISTS customers_wishlist_product_id_6788646b_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.customers_wishlist DROP CONSTRAINT IF EXISTS customers_wishlist_customer_id_8554e4f5_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_viewedproduct DROP CONSTRAINT IF EXISTS customers_viewedprod_product_id_f902dc9b_fk_products_;
ALTER TABLE IF EXISTS ONLY public.customers_viewedproduct DROP CONSTRAINT IF EXISTS customers_viewedprod_customer_id_8fa665f2_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_payment DROP CONSTRAINT IF EXISTS customers_payment_order_id_7af7afda_fk_customers_order_id;
ALTER TABLE IF EXISTS ONLY public.customers_orderstatushistory DROP CONSTRAINT IF EXISTS customers_orderstatu_order_id_34a07fdc_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_orderstatushistory DROP CONSTRAINT IF EXISTS customers_orderstatu_changed_by_id_71ca4256_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_orderitem DROP CONSTRAINT IF EXISTS customers_orderitem_variant_id_d4b3378b_fk_products_;
ALTER TABLE IF EXISTS ONLY public.customers_orderitem DROP CONSTRAINT IF EXISTS customers_orderitem_product_id_9189abb4_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.customers_orderitem DROP CONSTRAINT IF EXISTS customers_orderitem_order_id_0c19357b_fk_customers_order_id;
ALTER TABLE IF EXISTS ONLY public.customers_order DROP CONSTRAINT IF EXISTS customers_order_customer_id_032dd871_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.customers_delivery DROP CONSTRAINT IF EXISTS customers_delivery_order_id_006f6c75_fk_customers_order_id;
ALTER TABLE IF EXISTS ONLY public.customers_delivery DROP CONSTRAINT IF EXISTS customers_delivery_address_id_f3e68cce_fk_customers_address_id;
ALTER TABLE IF EXISTS ONLY public.customers_customerloyalty DROP CONSTRAINT IF EXISTS customers_customerlo_level_id_fb5f45fb_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_customerloyalty DROP CONSTRAINT IF EXISTS customers_customerlo_customer_id_539068e4_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_customer_user_permissions DROP CONSTRAINT IF EXISTS customers_customer_u_permission_id_36492949_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.customers_customer_user_permissions DROP CONSTRAINT IF EXISTS customers_customer_u_customer_id_39cf3cb6_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_customer_groups DROP CONSTRAINT IF EXISTS customers_customer_groups_group_id_f079b2be_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.customers_customer_groups DROP CONSTRAINT IF EXISTS customers_customer_g_customer_id_39e075d7_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_couponusage DROP CONSTRAINT IF EXISTS customers_couponusage_order_id_aa07dd51_fk_customers_order_id;
ALTER TABLE IF EXISTS ONLY public.customers_couponusage DROP CONSTRAINT IF EXISTS customers_couponusage_coupon_id_3c40cde6_fk_customers_coupon_id;
ALTER TABLE IF EXISTS ONLY public.customers_couponusage DROP CONSTRAINT IF EXISTS customers_couponusag_customer_id_cf9982e0_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_changelog DROP CONSTRAINT IF EXISTS customers_changelog_user_id_cc89dfbf_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.customers_cart DROP CONSTRAINT IF EXISTS customers_cart_variant_id_6b82f2f7_fk_products_;
ALTER TABLE IF EXISTS ONLY public.customers_cart DROP CONSTRAINT IF EXISTS customers_cart_product_id_f9590726_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.customers_cart DROP CONSTRAINT IF EXISTS customers_cart_customer_id_97ed88ec_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.customers_address DROP CONSTRAINT IF EXISTS customers_address_customer_id_f042422e_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX IF EXISTS public.unique_product_warehouse;
DROP INDEX IF EXISTS public.unique_product_attribute;
DROP INDEX IF EXISTS public.unique_customer_cart_item;
DROP INDEX IF EXISTS public.products_warranty_product_id_51395474;
DROP INDEX IF EXISTS public.products_tag_slug_5def095b_like;
DROP INDEX IF EXISTS public.products_tag_name_df2d816e_like;
DROP INDEX IF EXISTS public.products_supplier_slug_1073577c_like;
DROP INDEX IF EXISTS public.products_stock_variant_id_dc51ed5d;
DROP INDEX IF EXISTS public.products_stock_product_id_170f916b;
DROP INDEX IF EXISTS public.products_st_variant_10937e_idx;
DROP INDEX IF EXISTS public.products_st_product_282fcc_idx;
DROP INDEX IF EXISTS public.products_reviewimage_review_id_c90b3860;
DROP INDEX IF EXISTS public.products_review_product_id_d933ffa7;
DROP INDEX IF EXISTS public.products_review_customer_id_54220657;
DROP INDEX IF EXISTS public.products_promotionblock_slug_003da5f5_like;
DROP INDEX IF EXISTS public.products_promotionblock_products_promotionblock_id_e5dfe04c;
DROP INDEX IF EXISTS public.products_promotionblock_products_product_id_ea5f3c1a;
DROP INDEX IF EXISTS public.products_promotionblock_categories_promotionblock_id_dadbd43e;
DROP INDEX IF EXISTS public.products_promotionblock_categories_category_id_80df819f;
DROP INDEX IF EXISTS public.products_promocampaign_slug_68a6d529_like;
DROP INDEX IF EXISTS public.products_productvideo_product_id_872fe729;
DROP INDEX IF EXISTS public.products_productvariant_sku_1b692018_like;
DROP INDEX IF EXISTS public.products_productvariant_product_id_d9c22902;
DROP INDEX IF EXISTS public.products_productimage_variant_id_bf70ade8;
DROP INDEX IF EXISTS public.products_productimage_product_id_e747596a;
DROP INDEX IF EXISTS public.products_productattribute_variant_id_e4b8d9e4;
DROP INDEX IF EXISTS public.products_productattribute_product_id_b9a86828;
DROP INDEX IF EXISTS public.products_productattribute_attribute_id_de00002b;
DROP INDEX IF EXISTS public.products_product_slug_70d3148d_like;
DROP INDEX IF EXISTS public.products_product_feature_tags_tag_id;
DROP INDEX IF EXISTS public.products_product_feature_tags_product_id;
DROP INDEX IF EXISTS public.products_product_categories_product_id_50ef8156;
DROP INDEX IF EXISTS public.products_product_categories_category_id_27982bed;
DROP INDEX IF EXISTS public.products_product_brands_product_id_e551c83f;
DROP INDEX IF EXISTS public.products_product_brands_brand_id_283aac29;
DROP INDEX IF EXISTS public.products_pricehistory_variant_id_7a8d8d2e;
DROP INDEX IF EXISTS public.products_pricehistory_product_id_1fc0e3fe;
DROP INDEX IF EXISTS public.products_pr_variant_9e2fe6_idx;
DROP INDEX IF EXISTS public.products_pr_variant_989f38_idx;
DROP INDEX IF EXISTS public.products_pr_product_f0e7be_idx;
DROP INDEX IF EXISTS public.products_pr_product_94a04a_idx;
DROP INDEX IF EXISTS public.products_pr_product_66459e_idx;
DROP INDEX IF EXISTS public.products_pr_attribu_87c5a9_idx;
DROP INDEX IF EXISTS public.products_pr_attribu_4705f4_idx;
DROP INDEX IF EXISTS public.products_discount_variant_id_0ab210d0;
DROP INDEX IF EXISTS public.products_discount_promo_campaign_id_22319ff1;
DROP INDEX IF EXISTS public.products_discount_product_id_c39a20cb;
DROP INDEX IF EXISTS public.products_discount_category_id_7f843ced;
DROP INDEX IF EXISTS public.products_di_variant_7129c4_idx;
DROP INDEX IF EXISTS public.products_di_product_33ad43_idx;
DROP INDEX IF EXISTS public.products_di_categor_a1a6ee_idx;
DROP INDEX IF EXISTS public.products_certificate_product_id_7564eb6b;
DROP INDEX IF EXISTS public.products_category_slug_c558efae_like;
DROP INDEX IF EXISTS public.products_category_parent_id_3388f6c9;
DROP INDEX IF EXISTS public.products_category_brands_category_id_f3697e5d;
DROP INDEX IF EXISTS public.products_category_brands_brand_id_fc34923b;
DROP INDEX IF EXISTS public.products_category_attributes_category_id_bf20cdc7;
DROP INDEX IF EXISTS public.products_category_attributes_attribute_id_4cd0be2e;
DROP INDEX IF EXISTS public.products_blogpost_tags_tag_id_195753d7;
DROP INDEX IF EXISTS public.products_blogpost_tags_blogpost_id_413833f9;
DROP INDEX IF EXISTS public.products_blogpost_slug_59c8d621_like;
DROP INDEX IF EXISTS public.products_blogpost_related_products_product_id_de7a3b9d;
DROP INDEX IF EXISTS public.products_blogpost_related_products_blogpost_id_8b6639e4;
DROP INDEX IF EXISTS public.products_blogpost_author_id_567d983f;
DROP INDEX IF EXISTS public.products_bl_status_aab172_idx;
DROP INDEX IF EXISTS public.products_banner_category_id_6ffcde53;
DROP INDEX IF EXISTS public.products_attribute_slug_3436e67a_like;
DROP INDEX IF EXISTS public.products_attribute_name_e203e819_like;
DROP INDEX IF EXISTS public.products_at_type_f4fcf3_idx;
DROP INDEX IF EXISTS public.products_adminsection_key_7d3f08c7_like;
DROP INDEX IF EXISTS public.notifications_notificationsettings_name_de22d795_like;
DROP INDEX IF EXISTS public.notifications_notificationlog_order_id_275e19e6;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.customers_wishlist_product_id_6788646b;
DROP INDEX IF EXISTS public.customers_wishlist_customer_id_8554e4f5;
DROP INDEX IF EXISTS public.customers_viewedproduct_product_id_f902dc9b;
DROP INDEX IF EXISTS public.customers_viewedproduct_customer_id_8fa665f2;
DROP INDEX IF EXISTS public.customers_payment_order_id_7af7afda;
DROP INDEX IF EXISTS public.customers_orderstatushistory_order_id_34a07fdc;
DROP INDEX IF EXISTS public.customers_orderstatushistory_changed_by_id_71ca4256;
DROP INDEX IF EXISTS public.customers_orderitem_variant_id_d4b3378b;
DROP INDEX IF EXISTS public.customers_orderitem_product_id_9189abb4;
DROP INDEX IF EXISTS public.customers_orderitem_order_id_0c19357b;
DROP INDEX IF EXISTS public.customers_order_order_number_b3d7f651_like;
DROP INDEX IF EXISTS public.customers_order_customer_id_032dd871;
DROP INDEX IF EXISTS public.customers_loyaltyprogram_slug_dc3ba2d5_like;
DROP INDEX IF EXISTS public.customers_delivery_address_id_f3e68cce;
DROP INDEX IF EXISTS public.customers_customerloyalty_level_id_fb5f45fb;
DROP INDEX IF EXISTS public.customers_customer_user_permissions_permission_id_36492949;
DROP INDEX IF EXISTS public.customers_customer_user_permissions_customer_id_39cf3cb6;
DROP INDEX IF EXISTS public.customers_customer_groups_group_id_f079b2be;
DROP INDEX IF EXISTS public.customers_customer_groups_customer_id_39e075d7;
DROP INDEX IF EXISTS public.customers_customer_email_300e404b_like;
DROP INDEX IF EXISTS public.customers_couponusage_order_id_aa07dd51;
DROP INDEX IF EXISTS public.customers_couponusage_customer_id_cf9982e0;
DROP INDEX IF EXISTS public.customers_couponusage_coupon_id_3c40cde6;
DROP INDEX IF EXISTS public.customers_coupon_code_6015aa33_like;
DROP INDEX IF EXISTS public.customers_changelog_user_id_cc89dfbf;
DROP INDEX IF EXISTS public.customers_cart_variant_id_6b82f2f7;
DROP INDEX IF EXISTS public.customers_cart_session_key_fe9c4fe9_like;
DROP INDEX IF EXISTS public.customers_cart_session_key_fe9c4fe9;
DROP INDEX IF EXISTS public.customers_cart_product_id_f9590726;
DROP INDEX IF EXISTS public.customers_cart_customer_id_97ed88ec;
DROP INDEX IF EXISTS public.customers_c_model_n_b180dc_idx;
DROP INDEX IF EXISTS public.customers_c_created_3f28da_idx;
DROP INDEX IF EXISTS public.customers_address_customer_id_f042422e;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
ALTER TABLE IF EXISTS ONLY public.products_stock DROP CONSTRAINT IF EXISTS unique_variant_warehouse;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS unique_variant_attribute;
ALTER TABLE IF EXISTS ONLY public.services_serviceitem DROP CONSTRAINT IF EXISTS services_serviceitem_pkey;
ALTER TABLE IF EXISTS ONLY public.products_warranty DROP CONSTRAINT IF EXISTS products_warranty_pkey;
ALTER TABLE IF EXISTS ONLY public.products_tag DROP CONSTRAINT IF EXISTS products_tag_slug_key1;
ALTER TABLE IF EXISTS ONLY public.products_brand DROP CONSTRAINT IF EXISTS products_tag_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_tag DROP CONSTRAINT IF EXISTS products_tag_pkey1;
ALTER TABLE IF EXISTS ONLY public.products_brand DROP CONSTRAINT IF EXISTS products_tag_pkey;
ALTER TABLE IF EXISTS ONLY public.products_tag DROP CONSTRAINT IF EXISTS products_tag_name_key1;
ALTER TABLE IF EXISTS ONLY public.products_brand DROP CONSTRAINT IF EXISTS products_tag_name_key;
ALTER TABLE IF EXISTS ONLY public.products_supplier DROP CONSTRAINT IF EXISTS products_supplier_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_supplier DROP CONSTRAINT IF EXISTS products_supplier_pkey;
ALTER TABLE IF EXISTS ONLY public.products_stock DROP CONSTRAINT IF EXISTS products_stock_pkey;
ALTER TABLE IF EXISTS ONLY public.products_reviewimage DROP CONSTRAINT IF EXISTS products_reviewimage_pkey;
ALTER TABLE IF EXISTS ONLY public.products_review DROP CONSTRAINT IF EXISTS products_review_product_id_customer_id_aea431ea_uniq;
ALTER TABLE IF EXISTS ONLY public.products_review DROP CONSTRAINT IF EXISTS products_review_pkey;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock DROP CONSTRAINT IF EXISTS products_promotionblock_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_products DROP CONSTRAINT IF EXISTS products_promotionblock_products_pkey;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock DROP CONSTRAINT IF EXISTS products_promotionblock_pkey;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_categories DROP CONSTRAINT IF EXISTS products_promotionblock_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_products DROP CONSTRAINT IF EXISTS products_promotionblock__promotionblock_id_produc_0dc90576_uniq;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_categories DROP CONSTRAINT IF EXISTS products_promotionblock__promotionblock_id_catego_ece4c1df_uniq;
ALTER TABLE IF EXISTS ONLY public.products_promocampaign DROP CONSTRAINT IF EXISTS products_promocampaign_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_promocampaign DROP CONSTRAINT IF EXISTS products_promocampaign_pkey;
ALTER TABLE IF EXISTS ONLY public.products_productvideo DROP CONSTRAINT IF EXISTS products_productvideo_pkey;
ALTER TABLE IF EXISTS ONLY public.products_productvariant DROP CONSTRAINT IF EXISTS products_productvariant_sku_key;
ALTER TABLE IF EXISTS ONLY public.products_productvariant DROP CONSTRAINT IF EXISTS products_productvariant_pkey;
ALTER TABLE IF EXISTS ONLY public.products_productimage DROP CONSTRAINT IF EXISTS products_productimage_pkey;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS products_productattribute_pkey;
ALTER TABLE IF EXISTS ONLY public.products_product DROP CONSTRAINT IF EXISTS products_product_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_product DROP CONSTRAINT IF EXISTS products_product_pkey;
ALTER TABLE IF EXISTS ONLY public.products_product_feature_tags DROP CONSTRAINT IF EXISTS products_product_feature_tags_product_id_tag_id_key;
ALTER TABLE IF EXISTS ONLY public.products_product_feature_tags DROP CONSTRAINT IF EXISTS products_product_feature_tags_pkey;
ALTER TABLE IF EXISTS ONLY public.products_product_categories DROP CONSTRAINT IF EXISTS products_product_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.products_product_categories DROP CONSTRAINT IF EXISTS products_product_categor_product_id_category_id_a1f87bda_uniq;
ALTER TABLE IF EXISTS ONLY public.products_product_brands DROP CONSTRAINT IF EXISTS products_product_brands_product_id_brand_id_3fa625df_uniq;
ALTER TABLE IF EXISTS ONLY public.products_product_brands DROP CONSTRAINT IF EXISTS products_product_brands_pkey;
ALTER TABLE IF EXISTS ONLY public.products_pricehistory DROP CONSTRAINT IF EXISTS products_pricehistory_pkey;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_pkey;
ALTER TABLE IF EXISTS ONLY public.products_certificate DROP CONSTRAINT IF EXISTS products_certificate_pkey;
ALTER TABLE IF EXISTS ONLY public.products_category DROP CONSTRAINT IF EXISTS products_category_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_category DROP CONSTRAINT IF EXISTS products_category_pkey;
ALTER TABLE IF EXISTS ONLY public.products_category_brands DROP CONSTRAINT IF EXISTS products_category_brands_pkey;
ALTER TABLE IF EXISTS ONLY public.products_category_brands DROP CONSTRAINT IF EXISTS products_category_brands_category_id_brand_id_cb11283c_uniq;
ALTER TABLE IF EXISTS ONLY public.products_category_attributes DROP CONSTRAINT IF EXISTS products_category_attributes_pkey;
ALTER TABLE IF EXISTS ONLY public.products_category_attributes DROP CONSTRAINT IF EXISTS products_category_attrib_category_id_attribute_id_be9aa488_uniq;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_tags DROP CONSTRAINT IF EXISTS products_blogpost_tags_pkey;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_tags DROP CONSTRAINT IF EXISTS products_blogpost_tags_blogpost_id_tag_id_16be3b26_uniq;
ALTER TABLE IF EXISTS ONLY public.products_blogpost DROP CONSTRAINT IF EXISTS products_blogpost_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_related_products DROP CONSTRAINT IF EXISTS products_blogpost_related_products_pkey;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_related_products DROP CONSTRAINT IF EXISTS products_blogpost_relate_blogpost_id_product_id_db18a161_uniq;
ALTER TABLE IF EXISTS ONLY public.products_blogpost DROP CONSTRAINT IF EXISTS products_blogpost_pkey;
ALTER TABLE IF EXISTS ONLY public.products_banner DROP CONSTRAINT IF EXISTS products_banner_pkey;
ALTER TABLE IF EXISTS ONLY public.products_attribute DROP CONSTRAINT IF EXISTS products_attribute_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_attribute DROP CONSTRAINT IF EXISTS products_attribute_pkey;
ALTER TABLE IF EXISTS ONLY public.products_attribute DROP CONSTRAINT IF EXISTS products_attribute_name_key;
ALTER TABLE IF EXISTS ONLY public.products_adminsection DROP CONSTRAINT IF EXISTS products_adminsection_pkey;
ALTER TABLE IF EXISTS ONLY public.products_adminsection DROP CONSTRAINT IF EXISTS products_adminsection_key_key;
ALTER TABLE IF EXISTS ONLY public.notifications_notificationsettings DROP CONSTRAINT IF EXISTS notifications_notificationsettings_pkey;
ALTER TABLE IF EXISTS ONLY public.notifications_notificationsettings DROP CONSTRAINT IF EXISTS notifications_notificationsettings_name_key;
ALTER TABLE IF EXISTS ONLY public.notifications_notificationlog DROP CONSTRAINT IF EXISTS notifications_notificationlog_pkey;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_wishlist DROP CONSTRAINT IF EXISTS customers_wishlist_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_wishlist DROP CONSTRAINT IF EXISTS customers_wishlist_customer_id_product_id_c7c0b3de_uniq;
ALTER TABLE IF EXISTS ONLY public.customers_viewedproduct DROP CONSTRAINT IF EXISTS customers_viewedproduct_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_viewedproduct DROP CONSTRAINT IF EXISTS customers_viewedproduct_customer_id_product_id_01ba8d44_uniq;
ALTER TABLE IF EXISTS ONLY public.customers_payment DROP CONSTRAINT IF EXISTS customers_payment_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_orderstatushistory DROP CONSTRAINT IF EXISTS customers_orderstatushistory_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_orderitem DROP CONSTRAINT IF EXISTS customers_orderitem_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_order DROP CONSTRAINT IF EXISTS customers_order_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_order DROP CONSTRAINT IF EXISTS customers_order_order_number_key;
ALTER TABLE IF EXISTS ONLY public.customers_loyaltyprogram DROP CONSTRAINT IF EXISTS customers_loyaltyprogram_slug_key;
ALTER TABLE IF EXISTS ONLY public.customers_loyaltyprogram DROP CONSTRAINT IF EXISTS customers_loyaltyprogram_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_delivery DROP CONSTRAINT IF EXISTS customers_delivery_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_delivery DROP CONSTRAINT IF EXISTS customers_delivery_order_id_key;
ALTER TABLE IF EXISTS ONLY public.customers_customerloyalty DROP CONSTRAINT IF EXISTS customers_customerloyalty_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_customerloyalty DROP CONSTRAINT IF EXISTS customers_customerloyalty_customer_id_key;
ALTER TABLE IF EXISTS ONLY public.customers_customer_user_permissions DROP CONSTRAINT IF EXISTS customers_customer_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_customer_user_permissions DROP CONSTRAINT IF EXISTS customers_customer_user__customer_id_permission_i_cd47699c_uniq;
ALTER TABLE IF EXISTS ONLY public.customers_customer DROP CONSTRAINT IF EXISTS customers_customer_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_customer_groups DROP CONSTRAINT IF EXISTS customers_customer_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_customer_groups DROP CONSTRAINT IF EXISTS customers_customer_groups_customer_id_group_id_83eb0e0e_uniq;
ALTER TABLE IF EXISTS ONLY public.customers_customer DROP CONSTRAINT IF EXISTS customers_customer_email_key;
ALTER TABLE IF EXISTS ONLY public.customers_couponusage DROP CONSTRAINT IF EXISTS customers_couponusage_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_coupon DROP CONSTRAINT IF EXISTS customers_coupon_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_coupon DROP CONSTRAINT IF EXISTS customers_coupon_code_key;
ALTER TABLE IF EXISTS ONLY public.customers_changelog DROP CONSTRAINT IF EXISTS customers_changelog_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_cart DROP CONSTRAINT IF EXISTS customers_cart_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_address DROP CONSTRAINT IF EXISTS customers_address_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
DROP TABLE IF EXISTS public.services_serviceitem;
DROP TABLE IF EXISTS public.products_warranty;
DROP TABLE IF EXISTS public.products_tag;
DROP TABLE IF EXISTS public.products_supplier;
DROP TABLE IF EXISTS public.products_stock;
DROP TABLE IF EXISTS public.products_reviewimage;
DROP TABLE IF EXISTS public.products_review;
DROP TABLE IF EXISTS public.products_promotionblock_products;
DROP TABLE IF EXISTS public.products_promotionblock_categories;
DROP TABLE IF EXISTS public.products_promotionblock;
DROP TABLE IF EXISTS public.products_promocampaign;
DROP TABLE IF EXISTS public.products_productvideo;
DROP TABLE IF EXISTS public.products_productvariant;
DROP TABLE IF EXISTS public.products_productimage;
DROP TABLE IF EXISTS public.products_productattribute;
DROP TABLE IF EXISTS public.products_product_feature_tags;
DROP TABLE IF EXISTS public.products_product_categories;
DROP TABLE IF EXISTS public.products_product_brands;
DROP TABLE IF EXISTS public.products_product;
DROP TABLE IF EXISTS public.products_pricehistory;
DROP TABLE IF EXISTS public.products_discount;
DROP TABLE IF EXISTS public.products_certificate;
DROP TABLE IF EXISTS public.products_category_brands;
DROP TABLE IF EXISTS public.products_category_attributes;
DROP TABLE IF EXISTS public.products_category;
DROP TABLE IF EXISTS public.products_brand;
DROP TABLE IF EXISTS public.products_blogpost_tags;
DROP TABLE IF EXISTS public.products_blogpost_related_products;
DROP TABLE IF EXISTS public.products_blogpost;
DROP TABLE IF EXISTS public.products_banner;
DROP TABLE IF EXISTS public.products_attribute;
DROP TABLE IF EXISTS public.products_adminsection;
DROP TABLE IF EXISTS public.notifications_notificationsettings;
DROP TABLE IF EXISTS public.notifications_notificationlog;
DROP TABLE IF EXISTS public.django_session;
DROP TABLE IF EXISTS public.django_migrations;
DROP TABLE IF EXISTS public.django_content_type;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.customers_wishlist;
DROP TABLE IF EXISTS public.customers_viewedproduct;
DROP TABLE IF EXISTS public.customers_payment;
DROP TABLE IF EXISTS public.customers_orderstatushistory;
DROP TABLE IF EXISTS public.customers_orderitem;
DROP TABLE IF EXISTS public.customers_order;
DROP TABLE IF EXISTS public.customers_loyaltyprogram;
DROP TABLE IF EXISTS public.customers_delivery;
DROP TABLE IF EXISTS public.customers_customerloyalty;
DROP TABLE IF EXISTS public.customers_customer_user_permissions;
DROP TABLE IF EXISTS public.customers_customer_groups;
DROP TABLE IF EXISTS public.customers_customer;
DROP TABLE IF EXISTS public.customers_couponusage;
DROP TABLE IF EXISTS public.customers_coupon;
DROP TABLE IF EXISTS public.customers_changelog;
DROP TABLE IF EXISTS public.customers_cart;
DROP TABLE IF EXISTS public.customers_address;
DROP TABLE IF EXISTS public.auth_permission;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP TABLE IF EXISTS public.auth_group;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_address (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    country character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    street character varying(255) NOT NULL,
    house character varying(50) NOT NULL,
    apartment character varying(50) NOT NULL,
    postal_code character varying(20) NOT NULL,
    is_default boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    customer_id bigint NOT NULL
);


--
-- Name: customers_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_address ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_cart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_cart (
    id bigint NOT NULL,
    session_key character varying(100) NOT NULL,
    quantity integer NOT NULL,
    added_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    customer_id bigint,
    product_id bigint NOT NULL,
    variant_id bigint,
    CONSTRAINT customers_cart_quantity_check CHECK ((quantity >= 0))
);


--
-- Name: customers_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_changelog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_changelog (
    id bigint NOT NULL,
    action character varying(10) NOT NULL,
    model_name character varying(100) NOT NULL,
    object_id integer NOT NULL,
    object_repr character varying(255) NOT NULL,
    changes jsonb NOT NULL,
    ip_address inet,
    created_at timestamp with time zone NOT NULL,
    user_id bigint,
    CONSTRAINT customers_changelog_object_id_check CHECK ((object_id >= 0))
);


--
-- Name: customers_changelog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_changelog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_changelog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_coupon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_coupon (
    id bigint NOT NULL,
    code character varying(50) NOT NULL,
    discount_type character varying(10) NOT NULL,
    value numeric(10,2) NOT NULL,
    min_order_amount numeric(10,2) NOT NULL,
    max_uses integer NOT NULL,
    used_count integer NOT NULL,
    max_uses_per_user integer NOT NULL,
    is_active boolean NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    CONSTRAINT customers_coupon_max_uses_check CHECK ((max_uses >= 0)),
    CONSTRAINT customers_coupon_max_uses_per_user_check CHECK ((max_uses_per_user >= 0)),
    CONSTRAINT customers_coupon_used_count_check CHECK ((used_count >= 0))
);


--
-- Name: customers_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_coupon ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_couponusage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_couponusage (
    id bigint NOT NULL,
    discount_amount numeric(10,2) NOT NULL,
    used_at timestamp with time zone NOT NULL,
    coupon_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    order_id bigint
);


--
-- Name: customers_couponusage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_couponusage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_couponusage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_customer (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    nickname character varying(100) NOT NULL
);


--
-- Name: customers_customer_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_customer_groups (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: customers_customer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_customer_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_customer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_customer ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_customer_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_customer_user_permissions (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: customers_customer_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_customer_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_customer_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_customerloyalty; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_customerloyalty (
    id bigint NOT NULL,
    total_orders integer NOT NULL,
    total_spent numeric(10,2) NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    customer_id bigint NOT NULL,
    level_id bigint,
    CONSTRAINT customers_customerloyalty_total_orders_check CHECK ((total_orders >= 0))
);


--
-- Name: customers_customerloyalty_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_customerloyalty ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_customerloyalty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_delivery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_delivery (
    id bigint NOT NULL,
    address_snapshot text NOT NULL,
    tracking_number character varying(100) NOT NULL,
    courier character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    estimated_date date,
    delivered_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    address_id bigint,
    order_id bigint NOT NULL
);


--
-- Name: customers_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_delivery ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_loyaltyprogram; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_loyaltyprogram (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text NOT NULL,
    min_orders integer NOT NULL,
    min_spent numeric(10,2) NOT NULL,
    discount_percent numeric(4,1) NOT NULL,
    free_shipping boolean NOT NULL,
    priority_support boolean NOT NULL,
    is_active boolean NOT NULL,
    sort_order integer NOT NULL,
    CONSTRAINT customers_loyaltyprogram_min_orders_check CHECK ((min_orders >= 0))
);


--
-- Name: customers_loyaltyprogram_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_loyaltyprogram ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_loyaltyprogram_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_order (
    id bigint NOT NULL,
    order_number character varying(50) NOT NULL,
    status character varying(20) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    phone1 character varying(20) NOT NULL,
    phone2 character varying(20) NOT NULL,
    address text NOT NULL,
    comments text NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    customer_id bigint
);


--
-- Name: customers_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_order ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_orderitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_orderitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    variant_id bigint,
    CONSTRAINT customers_orderitem_quantity_check CHECK ((quantity >= 0))
);


--
-- Name: customers_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_orderitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_orderstatushistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_orderstatushistory (
    id bigint NOT NULL,
    old_status character varying(20) NOT NULL,
    new_status character varying(20) NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    changed_by_id bigint,
    order_id bigint NOT NULL
);


--
-- Name: customers_orderstatushistory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_orderstatushistory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_orderstatushistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_payment (
    id bigint NOT NULL,
    method character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    amount numeric(10,2) NOT NULL,
    external_id character varying(255) NOT NULL,
    paid_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    order_id bigint NOT NULL
);


--
-- Name: customers_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_payment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_viewedproduct; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_viewedproduct (
    id bigint NOT NULL,
    viewed_at timestamp with time zone NOT NULL,
    view_count integer NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT customers_viewedproduct_view_count_check CHECK ((view_count >= 0))
);


--
-- Name: customers_viewedproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_viewedproduct ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_viewedproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_wishlist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_wishlist (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: customers_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_wishlist ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: notifications_notificationlog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications_notificationlog (
    id bigint NOT NULL,
    notification_type character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    message text NOT NULL,
    recipient character varying(255) NOT NULL,
    error_message text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    sent_at timestamp with time zone,
    order_id bigint
);


--
-- Name: notifications_notificationlog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.notifications_notificationlog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.notifications_notificationlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: notifications_notificationsettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications_notificationsettings (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    telegram_enabled boolean NOT NULL,
    telegram_chat_id character varying(100) NOT NULL,
    email_enabled boolean NOT NULL,
    email_address character varying(254) NOT NULL,
    notify_new_orders boolean NOT NULL,
    notify_status_changes boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: notifications_notificationsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.notifications_notificationsettings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.notifications_notificationsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_adminsection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_adminsection (
    id bigint NOT NULL,
    key character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    is_visible boolean NOT NULL,
    is_visible_by_default boolean NOT NULL,
    sort_order integer NOT NULL
);


--
-- Name: products_adminsection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_adminsection ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_adminsection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_attribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_attribute (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    unit character varying(100) NOT NULL,
    enum_options jsonb,
    type character varying(10) NOT NULL
);


--
-- Name: products_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_attribute ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_banner; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_banner (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    subtitle text NOT NULL,
    image character varying(100) NOT NULL,
    image_mobile character varying(100),
    link character varying(200) NOT NULL,
    placement character varying(20) NOT NULL,
    is_active boolean NOT NULL,
    sort_order integer NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    category_id bigint
);


--
-- Name: products_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_banner ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_blogpost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blogpost (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    excerpt text NOT NULL,
    content text NOT NULL,
    image character varying(100),
    status character varying(20) NOT NULL,
    meta_title character varying(255) NOT NULL,
    meta_description text NOT NULL,
    published_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    author_id bigint,
    noindex boolean NOT NULL
);


--
-- Name: products_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_blogpost ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_blogpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_blogpost_related_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blogpost_related_products (
    id bigint NOT NULL,
    blogpost_id bigint NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_blogpost_related_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_blogpost_related_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_blogpost_related_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_blogpost_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blogpost_tags (
    id bigint NOT NULL,
    blogpost_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


--
-- Name: products_blogpost_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_blogpost_tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_blogpost_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_brand; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_brand (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    country character varying(100) NOT NULL,
    description text NOT NULL,
    logo character varying(100),
    website character varying(200) NOT NULL,
    logo_provenance character varying(30) NOT NULL,
    is_active boolean NOT NULL
);


--
-- Name: products_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_category (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    header_order integer NOT NULL,
    parent_id bigint,
    h1 character varying(255) NOT NULL,
    meta_description text NOT NULL,
    meta_title character varying(255) NOT NULL,
    image character varying(100),
    noindex boolean NOT NULL,
    page_description text NOT NULL
);


--
-- Name: products_category_attributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_category_attributes (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    attribute_id bigint NOT NULL
);


--
-- Name: products_category_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_category_attributes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_category_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_category_brands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_category_brands (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    brand_id bigint NOT NULL
);


--
-- Name: products_category_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_category_brands ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_category_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_certificate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_certificate (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    sort_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_certificate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_certificate ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_certificate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_discount; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_discount (
    id bigint NOT NULL,
    discount_type character varying(10) NOT NULL,
    value numeric(10,2) NOT NULL,
    is_active boolean NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    min_quantity integer NOT NULL,
    category_id bigint,
    product_id bigint,
    variant_id bigint,
    promo_campaign_id bigint,
    CONSTRAINT products_discount_min_quantity_check CHECK ((min_quantity >= 0))
);


--
-- Name: products_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_discount ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_pricehistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_pricehistory (
    id bigint NOT NULL,
    old_price numeric(10,2) NOT NULL,
    new_price numeric(10,2) NOT NULL,
    changed_at timestamp with time zone NOT NULL,
    reason character varying(255) NOT NULL,
    product_id bigint,
    variant_id bigint
);


--
-- Name: products_pricehistory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_pricehistory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_pricehistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_product (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    is_active boolean NOT NULL,
    is_new boolean NOT NULL,
    is_favorite boolean NOT NULL,
    slug character varying(255) NOT NULL,
    h1 character varying(255) NOT NULL,
    meta_description text NOT NULL,
    meta_title character varying(255) NOT NULL,
    noindex boolean NOT NULL
);


--
-- Name: products_product_brands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_product_brands (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    brand_id bigint NOT NULL
);


--
-- Name: products_product_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_product_brands ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_product_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_product_categories (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: products_product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_product_categories ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_product_feature_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_product_feature_tags (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


--
-- Name: products_product_feature_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_product_feature_tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_feature_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_productattribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productattribute (
    id bigint NOT NULL,
    attribute_id bigint NOT NULL,
    product_id bigint,
    value_bool boolean,
    value_enum character varying(255) NOT NULL,
    value_int integer,
    value_str character varying(1024) NOT NULL,
    variant_id bigint
);


--
-- Name: products_productattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_productattribute ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_productattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_productimage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productimage (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    is_main boolean NOT NULL,
    product_id bigint,
    alt_text character varying(255) NOT NULL,
    image_type character varying(20) NOT NULL,
    sort_order integer NOT NULL,
    variant_id bigint,
    provenance character varying(20) DEFAULT 'web'::character varying NOT NULL
);


--
-- Name: products_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_productimage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_productvariant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productvariant (
    id bigint NOT NULL,
    sku character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    price_override numeric(10,2),
    is_active boolean NOT NULL,
    sort_order integer NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_productvariant_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_productvariant ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_productvariant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_productvideo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productvideo (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    url character varying(200) NOT NULL,
    platform character varying(50) NOT NULL,
    thumbnail character varying(100),
    sort_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_productvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_productvideo ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_productvideo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_promocampaign; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_promocampaign (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text NOT NULL,
    is_active boolean NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    banner_image character varying(100),
    priority integer NOT NULL
);


--
-- Name: products_promocampaign_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_promocampaign ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_promocampaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_promotionblock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_promotionblock (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text NOT NULL,
    is_active boolean NOT NULL,
    sort_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);


--
-- Name: products_promotionblock_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_promotionblock_categories (
    id bigint NOT NULL,
    promotionblock_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: products_promotionblock_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_promotionblock_categories ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_promotionblock_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_promotionblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_promotionblock ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_promotionblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_promotionblock_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_promotionblock_products (
    id bigint NOT NULL,
    promotionblock_id bigint NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_promotionblock_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_promotionblock_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_promotionblock_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_review; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_review (
    id bigint NOT NULL,
    rating integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    text text NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    verified_purchase boolean NOT NULL
);


--
-- Name: products_review_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_review ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_reviewimage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_reviewimage (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    sort_order integer NOT NULL,
    review_id bigint NOT NULL
);


--
-- Name: products_reviewimage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_reviewimage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_reviewimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_stock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_stock (
    id bigint NOT NULL,
    warehouse character varying(100) NOT NULL,
    quantity integer NOT NULL,
    reserved integer NOT NULL,
    product_id bigint,
    variant_id bigint,
    CONSTRAINT products_stock_quantity_check CHECK ((quantity >= 0)),
    CONSTRAINT products_stock_reserved_check CHECK ((reserved >= 0))
);


--
-- Name: products_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_stock ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_supplier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_supplier (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    contact_person character varying(200) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(50) NOT NULL,
    website character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    notes text NOT NULL
);


--
-- Name: products_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_supplier ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_tag (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


--
-- Name: products_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_brand ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_tag_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_tag ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_tag_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_warranty; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_warranty (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    duration_value integer NOT NULL,
    duration_unit character varying(10) NOT NULL,
    description text NOT NULL,
    document character varying(100),
    is_active boolean NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT products_warranty_duration_value_check CHECK ((duration_value >= 0))
);


--
-- Name: products_warranty_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_warranty ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_warranty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: services_serviceitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services_serviceitem (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    category character varying(20) NOT NULL,
    is_active boolean NOT NULL,
    sort_order integer NOT NULL
);


--
-- Name: services_serviceitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.services_serviceitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.services_serviceitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	3	add_permission
6	Can change permission	3	change_permission
7	Can delete permission	3	delete_permission
8	Can view permission	3	view_permission
9	Can add group	2	add_group
10	Can change group	2	change_group
11	Can delete group	2	delete_group
12	Can view group	2	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_customer
22	Can change user	6	change_customer
23	Can delete user	6	delete_customer
24	Can view user	6	view_customer
25	Can add Заказ	7	add_order
26	Can change Заказ	7	change_order
27	Can delete Заказ	7	delete_order
28	Can view Заказ	7	view_order
29	Can add Товар в заказе	8	add_orderitem
30	Can change Товар в заказе	8	change_orderitem
31	Can delete Товар в заказе	8	delete_orderitem
32	Can view Товар в заказе	8	view_orderitem
33	Can add Атрибут	9	add_attribute
34	Can change Атрибут	9	change_attribute
35	Can delete Атрибут	9	delete_attribute
36	Can view Атрибут	9	view_attribute
37	Can add Бренд	15	add_tag
38	Can change Бренд	15	change_tag
39	Can delete Бренд	15	delete_tag
40	Can view Бренд	15	view_tag
41	Can add Категория	10	add_category
42	Can change Категория	10	change_category
43	Can delete Категория	10	delete_category
44	Can view Категория	10	view_category
45	Can add Товар	11	add_product
46	Can change Товар	11	change_product
47	Can delete Товар	11	delete_product
48	Can view Товар	11	view_product
49	Can add Изображение товара	13	add_productimage
50	Can change Изображение товара	13	change_productimage
51	Can delete Изображение товара	13	delete_productimage
52	Can view Изображение товара	13	view_productimage
53	Can add Атрибут товара	12	add_productattribute
54	Can change Атрибут товара	12	change_productattribute
55	Can delete Атрибут товара	12	delete_productattribute
56	Can view Атрибут товара	12	view_productattribute
57	Can add Отзыв	14	add_review
58	Can change Отзыв	14	change_review
59	Can delete Отзыв	14	delete_review
60	Can view Отзыв	14	view_review
61	Can add Настройки уведомлений	17	add_notificationsettings
62	Can change Настройки уведомлений	17	change_notificationsettings
63	Can delete Настройки уведомлений	17	delete_notificationsettings
64	Can view Настройки уведомлений	17	view_notificationsettings
65	Can add Лог уведомлений	16	add_notificationlog
66	Can change Лог уведомлений	16	change_notificationlog
67	Can delete Лог уведомлений	16	delete_notificationlog
68	Can view Лог уведомлений	16	view_notificationlog
69	Can add Бренд	15	add_brand
70	Can change Бренд	15	change_brand
71	Can delete Бренд	15	delete_brand
72	Can view Бренд	15	view_brand
73	Can add Тег	20	add_tag
74	Can change Тег	20	change_tag
75	Can delete Тег	20	delete_tag
76	Can view Тег	20	view_tag
77	Can add Вариант товара	18	add_productvariant
78	Can change Вариант товара	18	change_productvariant
79	Can delete Вариант товара	18	delete_productvariant
80	Can view Вариант товара	18	view_productvariant
81	Can add Складской остаток	19	add_stock
82	Can change Складской остаток	19	change_stock
83	Can delete Складской остаток	19	delete_stock
84	Can view Складской остаток	19	view_stock
85	Can add Адрес доставки	21	add_address
86	Can change Адрес доставки	21	change_address
87	Can delete Адрес доставки	21	delete_address
88	Can view Адрес доставки	21	view_address
89	Can add Доставка	22	add_delivery
90	Can change Доставка	22	change_delivery
91	Can delete Доставка	22	delete_delivery
92	Can view Доставка	22	view_delivery
93	Can add История статуса заказа	23	add_orderstatushistory
94	Can change История статуса заказа	23	change_orderstatushistory
95	Can delete История статуса заказа	23	delete_orderstatushistory
96	Can view История статуса заказа	23	view_orderstatushistory
97	Can add Платёж	24	add_payment
98	Can change Платёж	24	change_payment
99	Can delete Платёж	24	delete_payment
100	Can view Платёж	24	view_payment
101	Can add Акция	27	add_promocampaign
102	Can change Акция	27	change_promocampaign
103	Can delete Акция	27	delete_promocampaign
104	Can view Акция	27	view_promocampaign
105	Can add Фото отзыва	28	add_reviewimage
106	Can change Фото отзыва	28	change_reviewimage
107	Can delete Фото отзыва	28	delete_reviewimage
108	Can view Фото отзыва	28	view_reviewimage
109	Can add История цены	26	add_pricehistory
110	Can change История цены	26	change_pricehistory
111	Can delete История цены	26	delete_pricehistory
112	Can view История цены	26	view_pricehistory
113	Can add Скидка	25	add_discount
114	Can change Скидка	25	change_discount
115	Can delete Скидка	25	delete_discount
116	Can view Скидка	25	view_discount
117	Can add Корзина	29	add_cart
118	Can change Корзина	29	change_cart
119	Can delete Корзина	29	delete_cart
120	Can view Корзина	29	view_cart
121	Can add Просмотренный товар	30	add_viewedproduct
122	Can change Просмотренный товар	30	change_viewedproduct
123	Can delete Просмотренный товар	30	delete_viewedproduct
124	Can view Просмотренный товар	30	view_viewedproduct
125	Can add Избранное	31	add_wishlist
126	Can change Избранное	31	change_wishlist
127	Can delete Избранное	31	delete_wishlist
128	Can view Избранное	31	view_wishlist
129	Can add Видео товара	32	add_productvideo
130	Can change Видео товара	32	change_productvideo
131	Can delete Видео товара	32	delete_productvideo
132	Can view Видео товара	32	view_productvideo
133	Can add Уровень лояльности	37	add_loyaltyprogram
134	Can change Уровень лояльности	37	change_loyaltyprogram
135	Can delete Уровень лояльности	37	delete_loyaltyprogram
136	Can view Уровень лояльности	37	view_loyaltyprogram
137	Can add Лояльность клиента	36	add_customerloyalty
138	Can change Лояльность клиента	36	change_customerloyalty
139	Can delete Лояльность клиента	36	delete_customerloyalty
140	Can view Лояльность клиента	36	view_customerloyalty
141	Can add Промокод	34	add_coupon
142	Can change Промокод	34	change_coupon
143	Can delete Промокод	34	delete_coupon
144	Can view Промокод	34	view_coupon
145	Can add Использование купона	35	add_couponusage
146	Can change Использование купона	35	change_couponusage
147	Can delete Использование купона	35	delete_couponusage
148	Can view Использование купона	35	view_couponusage
149	Can add Лог изменений	33	add_changelog
150	Can change Лог изменений	33	change_changelog
151	Can delete Лог изменений	33	delete_changelog
152	Can view Лог изменений	33	view_changelog
153	Can add Поставщик	42	add_supplier
154	Can change Поставщик	42	change_supplier
155	Can delete Поставщик	42	delete_supplier
156	Can view Поставщик	42	view_supplier
157	Can add Сертификат / документ	40	add_certificate
158	Can change Сертификат / документ	40	change_certificate
159	Can delete Сертификат / документ	40	delete_certificate
160	Can view Сертификат / документ	40	view_certificate
161	Can add Гарантия	43	add_warranty
162	Can change Гарантия	43	change_warranty
163	Can delete Гарантия	43	delete_warranty
164	Can view Гарантия	43	view_warranty
165	Can add Баннер	38	add_banner
166	Can change Баннер	38	change_banner
167	Can delete Баннер	38	delete_banner
168	Can view Баннер	38	view_banner
169	Can add Статья блога	39	add_blogpost
170	Can change Статья блога	39	change_blogpost
171	Can delete Статья блога	39	delete_blogpost
172	Can view Статья блога	39	view_blogpost
173	Can add Промо-блок	41	add_promotionblock
174	Can change Промо-блок	41	change_promotionblock
175	Can delete Промо-блок	41	delete_promotionblock
176	Can view Промо-блок	41	view_promotionblock
177	Can add Услуга	44	add_serviceitem
178	Can change Услуга	44	change_serviceitem
179	Can delete Услуга	44	delete_serviceitem
180	Can view Услуга	44	view_serviceitem
181	Can add Раздел админки	45	add_adminsection
182	Can change Раздел админки	45	change_adminsection
183	Can delete Раздел админки	45	delete_adminsection
184	Can view Раздел админки	45	view_adminsection
\.


--
-- Data for Name: customers_address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_address (id, title, first_name, last_name, phone, country, city, street, house, apartment, postal_code, is_default, created_at, customer_id) FROM stdin;
\.


--
-- Data for Name: customers_cart; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_cart (id, session_key, quantity, added_at, updated_at, customer_id, product_id, variant_id) FROM stdin;
\.


--
-- Data for Name: customers_changelog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_changelog (id, action, model_name, object_id, object_repr, changes, ip_address, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: customers_coupon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_coupon (id, code, discount_type, value, min_order_amount, max_uses, used_count, max_uses_per_user, is_active, start_date, end_date, created_at) FROM stdin;
\.


--
-- Data for Name: customers_couponusage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_couponusage (id, discount_amount, used_at, coupon_id, customer_id, order_id) FROM stdin;
\.


--
-- Data for Name: customers_customer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_customer (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email, nickname) FROM stdin;
2	pbkdf2_sha256$1200000$iCZN3d5y4JBgouDYR0GzXE$LhfezN1byB3W5+OFRNdnjCm8NFzdDAf7hLQoUqbO5E0=	\N	t			t	t	2026-07-09 13:28:11.186157+00	god1@gmail.com	god
4	pbkdf2_sha256$1200000$7Tsx055aNPnbvZSwrYXdhO$2j85F2wqApHnlKF7gU6mXRc994+QLTEbl91EHhSddk0=	2026-07-20 14:17:08.731329+00	t			t	t	2026-07-11 16:21:05.956767+00	god3@gmail.com	god3
3	pbkdf2_sha256$1200000$TfVq0zWZKusQOEKVIJf9z0$PbPryN5BQfXhEJtYNCG+FuQ/+txdM5CNnO/fSr7zqDY=	2026-07-29 06:10:11.223365+00	t			t	t	2026-07-09 13:34:16.284408+00	god2@gmail.com	god
5	pbkdf2_sha256$1200000$A47FOC6gdFTwEUAaSnwjLw$PRm4O9tiOioleyIwUnT87/B2yFO+H1+Nd5D3qqzNdNY=	\N	t			t	t	2026-08-09 16:29:15.381373+00	soshallitbe5@gmail.com	soshallitbe
1	pbkdf2_sha256$1200000$IVgcaO3i5WsayMEmFl45Jn$gQfNUwgicBmzyFz9OzUPazw9MRsJKk0x/hxQZMXWeK4=	2026-08-09 16:29:45.255354+00	t			t	t	2026-07-08 06:04:14+00	god@gmail.com	god
\.


--
-- Data for Name: customers_customer_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_customer_groups (id, customer_id, group_id) FROM stdin;
\.


--
-- Data for Name: customers_customer_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_customer_user_permissions (id, customer_id, permission_id) FROM stdin;
\.


--
-- Data for Name: customers_customerloyalty; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_customerloyalty (id, total_orders, total_spent, updated_at, customer_id, level_id) FROM stdin;
\.


--
-- Data for Name: customers_delivery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_delivery (id, address_snapshot, tracking_number, courier, status, estimated_date, delivered_at, created_at, address_id, order_id) FROM stdin;
\.


--
-- Data for Name: customers_loyaltyprogram; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_loyaltyprogram (id, name, slug, description, min_orders, min_spent, discount_percent, free_shipping, priority_support, is_active, sort_order) FROM stdin;
\.


--
-- Data for Name: customers_order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_order (id, order_number, status, first_name, last_name, email, phone1, phone2, address, comments, total_amount, created_at, updated_at, customer_id) FROM stdin;
1	ORD-483ECAE6	pending	Родион	Витенберг	rodionvitenberg@gmail.com	+996 550 418 317		Moskow 162	Сосите!	67800.00	2026-07-09 13:24:47.807865+00	2026-07-09 13:24:47.839729+00	\N
2	ORD-EA1A8231	pending	Winter	Wind	god@gmail.com	123		132		27500.00	2026-07-09 13:29:45.923536+00	2026-07-09 13:29:45.935027+00	\N
3	ORD-C93F09F2	pending								22600.00	2026-07-09 13:41:48.967085+00	2026-07-09 13:41:49.00417+00	\N
4	ORD-F82B4706	pending	Winter	Wind	2313@gmail.com	+996 550 418 317		Moskow 162		22600.00	2026-07-09 13:52:09.950012+00	2026-07-09 13:52:09.976072+00	\N
5	ORD-CF553390	pending	12	12	12	12		12		64800.00	2026-07-09 13:56:49.929179+00	2026-07-09 13:56:49.945656+00	\N
6	ORD-9FA4D2D9	pending	Rodion	Vitenberg		+996550418317		Moscow Street 92\nRakhmanova 95		27500.00	2026-07-10 14:00:29.364806+00	2026-07-10 14:00:29.39974+00	\N
9	ORD-E19AB90A	pending	Rodion	Vitenberg		+996550418317		Moscow Street 92\nRakhmanova 95		57800.00	2026-07-20 14:17:37.220711+00	2026-07-20 14:17:37.220725+00	\N
11	ORD-2C8A2655	pending	Rodion	Vitenberg		+996550418317		Moscow Street 92\nRakhmanova 95		62400.00	2026-07-20 14:39:33.151429+00	2026-07-20 14:39:33.151471+00	\N
15	Rodion-1	pending	Rodion	Vitenberg		+996550418317		Moscow Street 92\nRakhmanova 95		57800.00	2026-07-20 15:41:51.084929+00	2026-07-20 15:41:51.084999+00	\N
\.


--
-- Data for Name: customers_orderitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_orderitem (id, quantity, price, order_id, product_id, variant_id) FROM stdin;
\.


--
-- Data for Name: customers_orderstatushistory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_orderstatushistory (id, old_status, new_status, comment, created_at, changed_by_id, order_id) FROM stdin;
1		pending		2026-07-09 13:24:47.84367+00	\N	1
2		pending		2026-07-09 13:29:45.938434+00	\N	2
3		pending		2026-07-09 13:41:49.009223+00	\N	3
4		pending		2026-07-09 13:52:09.981872+00	\N	4
5		pending		2026-07-09 13:56:49.949389+00	\N	5
6		pending		2026-07-10 14:00:29.409146+00	\N	6
9		pending		2026-07-20 14:17:37.242761+00	\N	9
11		pending		2026-07-20 14:39:33.169854+00	\N	11
15		pending		2026-07-20 15:41:51.131896+00	\N	15
\.


--
-- Data for Name: customers_payment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_payment (id, method, status, amount, external_id, paid_at, created_at, order_id) FROM stdin;
\.


--
-- Data for Name: customers_viewedproduct; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_viewedproduct (id, viewed_at, view_count, customer_id, product_id) FROM stdin;
\.


--
-- Data for Name: customers_wishlist; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_wishlist (id, created_at, customer_id, product_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2026-07-08 06:21:22.220055+00	1	Компьютеры	1	[{"added": {}}]	10	1
2	2026-07-08 13:11:07.115335+00	106	Intel Core i5-14600K	2	[{"changed": {"fields": ["\\u041d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0430"]}}]	11	1
3	2026-07-09 05:50:47.042854+00	106	Intel Core i5-14600K	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
4	2026-07-09 05:50:54.856058+00	105	Cooler Master MasterBox TD500 Mesh V2	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
5	2026-07-09 05:51:02.695525+00	104	HyperX Cloud III Wireless	2	[{"changed": {"fields": ["\\u041d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0430", "\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
6	2026-07-09 05:51:13.907801+00	102	Razer DeathAdder V3 Pro	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
7	2026-07-09 05:51:23.650627+00	101	Logitech G Pro X Superlight 2	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
8	2026-07-09 05:51:33.346638+00	97	ASUS ROG Swift PG32UCDM	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
9	2026-07-09 05:59:48.66568+00	76	SATA3	1	[{"added": {}}]	10	1
10	2026-07-09 09:20:20.087374+00	77	M2	1	[{"added": {}}]	10	1
11	2026-07-09 09:20:53.554779+00	77	M2	3		10	1
12	2026-07-09 09:20:53.554821+00	76	SATA3	3		10	1
13	2026-07-09 17:57:56.480371+00	1	Анал	1	[{"added": {}}]	44	1
14	2026-07-10 15:34:49.815345+00	103	Объём SSD	2	[{"changed": {"fields": ["Slug", "\\u0415\\u0434\\u0438\\u043d\\u0438\\u0446\\u0430 \\u0438\\u0437\\u043c\\u0435\\u0440\\u0435\\u043d\\u0438\\u044f"]}}]	9	1
15	2026-07-11 15:17:37.345145+00	252	Acer	2	[]	15	1
16	2026-07-11 15:27:22.946225+00	1	god@gmail.com	2	[{"changed": {"fields": ["Superuser status"]}}]	6	1
17	2026-07-18 04:51:14.589927+00	162	Видеонаблюдение	1	[{"added": {}}]	10	4
18	2026-07-18 04:51:31.621408+00	158	Аксессуары	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u0445\\u0435\\u0434\\u0435\\u0440\\u0435"]}}]	10	4
19	2026-07-18 04:51:31.622739+00	162	Видеонаблюдение	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u0445\\u0435\\u0434\\u0435\\u0440\\u0435"]}}]	10	4
20	2026-07-18 04:51:43.947582+00	162	Видеонаблюдение	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u0445\\u0435\\u0434\\u0435\\u0440\\u0435"]}}]	10	4
21	2026-07-18 04:51:43.949576+00	158	Аксессуары	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u0445\\u0435\\u0434\\u0435\\u0440\\u0435"]}}]	10	4
22	2026-07-18 07:07:49.9075+00	163	TurboHD камеры	1	[{"added": {}}]	10	4
23	2026-07-18 07:09:50.204943+00	164	IP камеры	1	[{"added": {}}]	10	4
24	2026-07-18 07:10:34.676914+00	164	IP камеры	2	[{"changed": {"fields": ["\\u0420\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044c\\u0441\\u043a\\u0430\\u044f \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f"]}}]	10	4
25	2026-07-18 07:11:47.628507+00	165	Расходные материалы	1	[{"added": {}}]	10	4
26	2026-07-18 07:13:26.013212+00	1	Анал	3		44	4
27	2026-07-18 07:13:46.702294+00	2	Заправка картриджа (1010/1005)	1	[{"added": {}}]	44	4
28	2026-07-18 07:14:03.95245+00	3	Заправка картриджа (132)	1	[{"added": {}}]	44	4
29	2026-07-18 07:14:41.658591+00	4	Переустановка Windows	1	[{"added": {}}]	44	4
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	contenttypes	contenttype
5	sessions	session
6	customers	customer
7	customers	order
8	customers	orderitem
9	products	attribute
10	products	category
11	products	product
12	products	productattribute
13	products	productimage
14	products	review
16	notifications	notificationlog
17	notifications	notificationsettings
15	products	brand
18	products	productvariant
19	products	stock
20	products	tag
21	customers	address
22	customers	delivery
23	customers	orderstatushistory
24	customers	payment
25	products	discount
26	products	pricehistory
27	products	promocampaign
28	products	reviewimage
29	customers	cart
30	customers	viewedproduct
31	customers	wishlist
32	products	productvideo
33	customers	changelog
34	customers	coupon
35	customers	couponusage
36	customers	customerloyalty
37	customers	loyaltyprogram
38	products	banner
39	products	blogpost
40	products	certificate
41	products	promotionblock
42	products	supplier
43	products	warranty
44	services	serviceitem
45	products	adminsection
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-07-07 13:24:23.105911+00
2	contenttypes	0002_remove_content_type_name	2026-07-07 13:24:23.117241+00
3	auth	0001_initial	2026-07-07 13:24:23.159563+00
4	auth	0002_alter_permission_name_max_length	2026-07-07 13:24:23.168922+00
5	auth	0003_alter_user_email_max_length	2026-07-07 13:24:23.177177+00
6	auth	0004_alter_user_username_opts	2026-07-07 13:24:23.186843+00
7	auth	0005_alter_user_last_login_null	2026-07-07 13:24:23.195127+00
8	auth	0006_require_contenttypes_0002	2026-07-07 13:24:23.198747+00
9	auth	0007_alter_validators_add_error_messages	2026-07-07 13:24:23.207915+00
10	auth	0008_alter_user_username_max_length	2026-07-07 13:24:23.215488+00
11	auth	0009_alter_user_last_name_max_length	2026-07-07 13:24:23.2261+00
12	auth	0010_alter_group_name_max_length	2026-07-07 13:24:23.236136+00
13	auth	0011_update_proxy_permissions	2026-07-07 13:24:23.246131+00
14	auth	0012_alter_user_first_name_max_length	2026-07-07 13:24:23.255087+00
15	customers	0001_initial	2026-07-07 13:24:23.318664+00
16	admin	0001_initial	2026-07-07 13:24:23.347058+00
17	admin	0002_logentry_remove_auto_add	2026-07-07 13:24:23.359824+00
18	admin	0003_logentry_add_action_flag_choices	2026-07-07 13:24:23.374071+00
19	products	0001_initial	2026-07-07 13:24:23.489078+00
20	customers	0002_orderitem	2026-07-07 13:24:23.519709+00
21	sessions	0001_initial	2026-07-07 13:24:23.529905+00
22	products	0002_rename_tag_brand_remove_category_tags_and_more	2026-07-07 16:45:55.81858+00
23	products	0003_tag_product_feature_tags	2026-07-07 16:46:15.36803+00
24	products	0004_productvariant_stock_alter_productimage_options_and_more	2026-07-07 16:46:21.250014+00
25	products	0005_promocampaign_category_h1_category_meta_description_and_more	2026-07-07 17:10:11.141874+00
26	customers	0003_orderitem_variant_address_delivery_and_more	2026-07-07 17:10:11.343318+00
27	products	0006_brand_country_brand_description_brand_logo_and_more	2026-07-07 17:14:38.723126+00
28	customers	0004_cart_viewedproduct_wishlist	2026-07-07 17:14:38.925343+00
29	customers	0005_coupon_loyaltyprogram_couponusage_customerloyalty_and_more	2026-07-07 17:17:33.47441+00
30	products	0007_supplier_banner_certificate_promotionblock_warranty_and_more	2026-07-07 17:21:39.656653+00
31	notifications	0001_initial	2026-07-08 06:07:49.483191+00
32	customers	0006_alter_order_email	2026-07-09 13:31:43.394096+00
33	customers	0007_alter_order_address_alter_order_first_name_and_more	2026-07-09 13:46:36.740433+00
34	services	0001_initial	2026-07-09 17:54:08.794188+00
35	products	0008_adminsection_alter_certificate_options_and_more	2026-07-11 15:41:22.973893+00
36	products	0009_brand_logo_provenance_productimage_provenance	2026-07-13 06:25:34.154118+00
37	products	0009_productimage_provenance	2026-07-14 06:53:31.033617+00
38	products	0009_brand_is_active	2026-07-18 04:41:40.11661+00
39	products	0010_category_image	2026-07-18 05:01:29.91106+00
40	products	0011_brand_logo_provenance	2026-07-21 07:36:16.69586+00
41	products	0012_add_productimage_provenance	2026-07-29 06:07:40.98286+00
42	products	0013_blogpost_noindex_category_noindex_and_more	2026-07-29 11:02:16.799417+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
95k9y2a7mkrt2yezda999w2abh6ptnto	.eJxVjM0OwiAQhN-FsyGWnwIevfsMZJddbNVAUtqT8d2lSQ-auX3zzbxFhG2d4tZ4iTOJixjE6ZchpCeXvaAHlHuVqZZ1mVHuijzaJm-V-HU93L-DCdrU16gHBmdGNkQhcUDTg9bBmINVZsxoMinvgBx1AvacNCYHjCoY7b34fAENUDjV:1whmQk:bdEXlySxeG32BppEVYgnVcROGtnfPeBJsUpOruz_Eos	2026-07-10 10:56:34.402997+00
pjeubsdt9e0g1z030xt0hkmye5goyc5k	.eJxVjEEOgjAQRe_StWko0JZx6d4zNL8zg6AGEgor492VhIVu_3vvv0zCtg5pK7qkUczZtOb0u2XwQ6cdyB3TbbY8T-syZrsr9qDFXmfR5-Vw_w4GlOFba9Or-pDV1eIgVew6rkAxOACtduRrjaTQTAwOQN-wkBPUlNVHMu8PFb05XQ:1wl0TW:rhY3F1oHfDzUz3RTEqLRwh_xd9uIc8lJ-wSNNRygu4A	2026-07-19 08:32:46.464889+00
un58th45z1jrxm42kzgfji5sqn3u84gy	.eJxVjEEOgjAQRe_StWko0JZx6d4zNL8zg6AGEgor492VhIVu_3vvv0zCtg5pK7qkUczZtOb0u2XwQ6cdyB3TbbY8T-syZrsr9qDFXmfR5-Vw_w4GlOFba9Or-pDV1eIgVew6rkAxOACtduRrjaTQTAwOQN-wkBPUlNVHMu8PFb05XQ:1wlons:-NDGlXTJmiC6NyHGRM2JlAuTMopWoW01Ctdg-NspJjA	2026-07-21 14:17:08.89963+00
g4h9rt7z7fpdcqp481amgixl04ea5g1n	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1whsad:cAWnwljKVOya0W3WpXFT78lqeZYU14UXp0R9XzPsads	2026-07-10 17:31:11.356566+00
jt4lma1sk06ztt583t10so7wvyx8dov1	.eJxVjM0OwiAQhN-FsyGWnwIevfsMZJddbNVAUtqT8d2lSQ-auX3zzbxFhG2d4tZ4iTOJixjE6ZchpCeXvaAHlHuVqZZ1mVHuijzaJm-V-HU93L-DCdrU16gHBmdGNkQhcUDTg9bBmINVZsxoMinvgBx1AvacNCYHjCoY7b34fAENUDjV:1woxNX:fyorPRBH9Ynbbz4zlpvX374lr34ZdoUvKjlBGkRVmvs	2026-07-30 06:02:55.749379+00
tlgreuiimnyaclh72la5fk25mqgcdq67	.eJxVjEEOgjAQRe_StWko0JZx6d4zNL8zg6AGEgor492VhIVu_3vvv0zCtg5pK7qkUczZtOb0u2XwQ6cdyB3TbbY8T-syZrsr9qDFXmfR5-Vw_w4GlOFba9Or-pDV1eIgVew6rkAxOACtduRrjaTQTAwOQN-wkBPUlNVHMu8PFb05XQ:1wiaTw:9UEfpgkd5h9S-BpNfBJ_VYL4aBcB-ShsloKJOO9DFW0	2026-07-12 16:23:12.69687+00
p93g6atq33tgxa942oiezkm7x1bqhfit	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1wjAc4:5elCf-pcJAIOsXYRD2sfriTdPLVCxi5lFWPOB3PftL8	2026-07-14 06:58:00.428499+00
zqteuk7rm20m1nlr3sfzdarcasgtuv7a	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1woxUp:wOwX4Bas4Xwk42pAB0-27gXCKxfWyw6-7LL5v-Vvvkw	2026-07-30 06:10:27.485395+00
3sz8erotws12rsjwv5aj4xwi8jwhbuyg	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1wjdOn:0zU3LC3jQe5ttLTdfdIP1mHljMtsJTLe7830LE727eo	2026-07-15 13:42:13.828317+00
9k5hubwkbkxwz19c3eriycpc6c8cfc8y	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1wkP3g:HYUQ482QS3q5dMUwu9lxUAgpvgqSt7l50TZ-nYkUTXA	2026-07-17 16:35:36.407536+00
z4us97lu284ocfmqmv2m8z3858eifelt	.eJxVjM0OwiAQhN-FsyGWnwIevfsMZJddbNVAUtqT8d2lSQ-auX3zzbxFhG2d4tZ4iTOJixjE6ZchpCeXvaAHlHuVqZZ1mVHuijzaJm-V-HU93L-DCdrU16gHBmdGNkQhcUDTg9bBmINVZsxoMinvgBx1AvacNCYHjCoY7b34fAENUDjV:1wt6g0:j_4WdgMt3CwJAAVRGy8xuYwro0aQEqQJsRHh-IsOwE4	2026-08-10 16:47:08.795926+00
\.


--
-- Data for Name: notifications_notificationlog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications_notificationlog (id, notification_type, status, message, recipient, error_message, created_at, sent_at, order_id) FROM stdin;
\.


--
-- Data for Name: notifications_notificationsettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications_notificationsettings (id, name, telegram_enabled, telegram_chat_id, email_enabled, email_address, notify_new_orders, notify_status_changes, created_at, updated_at) FROM stdin;
1	Основные уведомления	t		f		t	f	2026-07-09 13:24:47.825445+00	2026-07-09 13:24:47.825456+00
\.


--
-- Data for Name: products_adminsection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_adminsection (id, key, label, is_visible, is_visible_by_default, sort_order) FROM stdin;
1	catalog_base	Каталог (товары, категории, бренды)	t	t	10
2	orders	Заказы и клиенты	t	t	20
3	services	Сервис (услуги)	t	t	30
4	blog	Блог	t	t	40
5	users	Пользователи	t	t	50
6	attributes	Атрибуты	t	f	60
7	tags	Теги	t	f	70
8	variants	Варианты товаров	t	f	80
9	stock	Остатки (склад)	t	f	90
10	suppliers	Поставщики	t	f	100
11	promocampaigns	Акции	t	f	110
12	discounts	Скидки	t	f	120
13	pricehistory	История цен	t	f	130
14	videos	Видео товаров	t	f	140
15	warranties	Гарантии	t	f	150
16	certificates	Сертификаты	t	f	160
17	promoblocks	Промо-блоки	t	f	170
18	coupons	Промокоды	t	f	180
19	loyalty	Программа лояльности	t	f	190
20	banners	Баннеры	t	f	200
21	changelog	Лог изменений	t	f	210
22	groups	Группы и права	t	f	220
\.


--
-- Data for Name: products_attribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_attribute (id, name, slug, unit, enum_options, type) FROM stdin;
265	Частота процессора	cpu-frequency	GHz	\N	int
266	Макс. частота (Boost)	max-boost-frequency	GHz	\N	int
267	Количество ядер	cores		\N	int
268	Количество потоков	threads		\N	int
269	Сокет	socket		["LGA1700", "LGA1200", "AM5", "AM4", "TR4", "sTRX4"]	enum
270	Техпроцесс	manufacturing-tech		\N	str
271	TDP	tdp	W	\N	int
273	Тип видеопамяти	vram-type		["GDDR6", "GDDR6X", "GDDR5", "GDDR5X", "HBM2"]	enum
274	Шина памяти	memory-bus	bit	\N	int
276	Тип ОЗУ	ram-type		["DDR5", "DDR4", "DDR3"]	enum
277	Частота ОЗУ	ram-frequency	MHz	\N	int
278	Количество планок	ram-modules		\N	int
279	Объём накопителя	storage-capacity	GB	\N	int
280	Тип накопителя	storage-type		["SSD", "HDD", "NVMe", "M.2 SATA"]	enum
281	Форм-фактор	form-factor		["2.5\\"", "3.5\\"", "M.2 2280", "M.2 2230", "mSATA", "ATX", "microATX", "Mini-ITX"]	enum
282	Скорость чтения	read-speed	MB/s	\N	int
283	Скорость записи	write-speed	MB/s	\N	int
285	Сертификат	certification		["80+ Bronze", "80+ Silver", "80+ Gold", "80+ Platinum", "80+ Titanium", "80+"]	enum
286	Модульность	modularity		["Non-modular", "Semi-modular", "Fully modular"]	enum
287	Диагональ экрана	screen-size		\N	str
288	Разрешение	resolution		\N	str
289	Тип матрицы	panel-type		["IPS", "VA", "TN", "OLED", "Nano IPS", "Fast IPS"]	enum
291	Время отклика	response-time	ms	\N	int
292	Изогнутый	curved		\N	bool
293	Яркость	brightness	cd/m²	\N	int
294	Диагональ ноутбука	laptop-screen-size		\N	str
295	Процессор (модель)	cpu-model		\N	str
296	Видеокарта (модель)	gpu-model		\N	str
297	Объём RAM	laptop-ram	GB	\N	int
299	Вес	weight		\N	str
300	Цвет	color		\N	str
301	Подсветка	backlight		\N	bool
302	Беспроводной	wireless		\N	bool
303	Механические переключатели	mechanical-switches		\N	bool
298	Объём SSD	laptop-ssd		\N	int
306	mechanical	mechanical		\N	bool
275	Объём ОЗУ	ram-capacity		\N	int
290	Частота обновления	refresh-rate		\N	int
284	Мощность БП	psu-wattage		\N	int
272	Объём видеопамяти	vram		\N	int
\.


--
-- Data for Name: products_banner; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_banner (id, title, subtitle, image, image_mobile, link, placement, is_active, sort_order, start_date, end_date, created_at, category_id) FROM stdin;
\.


--
-- Data for Name: products_blogpost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blogpost (id, title, slug, excerpt, content, image, status, meta_title, meta_description, published_at, created_at, updated_at, author_id, noindex) FROM stdin;
\.


--
-- Data for Name: products_blogpost_related_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blogpost_related_products (id, blogpost_id, product_id) FROM stdin;
\.


--
-- Data for Name: products_blogpost_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blogpost_tags (id, blogpost_id, tag_id) FROM stdin;
\.


--
-- Data for Name: products_brand; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_brand (id, name, slug, country, description, logo, website, logo_provenance, is_active) FROM stdin;
335	Logitech	logitech	Switzerland		brand_logos/logitech.png	https://www.logitech.com	wikipedia	t
351	Fractal Design	fractal-design	Sweden		brand_logos/fractal-design.png	https://www.fractal-design.com	favicon	t
337	Acer	acer	Taiwan		brand_logos/acer.png	https://www.acer.com	wikipedia	t
321	AMD	amd	USA		brand_logos/amd.png	https://www.amd.com	wikipedia	t
322	NVIDIA	nvidia	USA		brand_logos/nvidia.png	https://www.nvidia.com	wikipedia	t
320	Intel	intel	USA		brand_logos/intel.png	https://www.intel.com	wikipedia	t
374	Aeromax	aeromax	China				manual	t
338	Cooler Master	cooler-master	Taiwan		brand_logos/cooler-master.png	https://www.coolermaster.com	simpleicons	t
324	MSI	msi	Taiwan		brand_logos/msi.png	https://www.msi.com	wikipedia	t
323	ASUS	asus	Taiwan		brand_logos/asus.png	https://www.asus.com	wikipedia	t
353	Lian Li	lian-li	Taiwan		brand_logos/lian-li.png	https://www.lian-li.com	wikipedia	t
326	Samsung	samsung	South Korea		brand_logos/samsung.png	https://www.samsung.com	wikipedia	t
341	HyperX	hyperx	USA		brand_logos/hyperx.png	https://www.hyperxgaming.com	simpleicons	t
328	Dell	dell	USA		brand_logos/dell.png	https://www.dell.com	wikipedia	t
354	TeamGroup	teamgroup	Taiwan		brand_logos/teamgroup.svg	https://www.teamgroup.com	fallback	t
327	LG	lg	South Korea		brand_logos/lg.png	https://www.lg.com	simpleicons	t
340	Seasonic	seasonic	Taiwan		brand_logos/seasonic.png	https://www.seasonic.com	favicon	t
329	HP	hp	USA		brand_logos/hp.png	https://www.hp.com	wikipedia	t
352	NZXT	nzxt	USA		brand_logos/nzxt.png	https://www.nzxt.com	simpleicons	t
330	Lenovo	lenovo	China		brand_logos/lenovo.png	https://www.lenovo.com	wikipedia	t
343	BenQ	benq	Taiwan		brand_logos/benq.png	https://www.benq.com	wikipedia	t
331	Corsair	corsair	USA		brand_logos/corsair.png	https://www.corsair.com	simpleicons	t
375	HIKVISION	hikvision	China			https://www.hikvision.com	manual	t
333	Seagate	seagate	Ireland		brand_logos/seagate.png	https://www.seagate.com	wikipedia	t
342	SteelSeries	steelseries	Denmark		brand_logos/steelseries.png	https://www.steelseries.com	simpleicons	t
334	Western Digital	western-digital	USA		brand_logos/western-digital.png	https://www.westerndigital.com	wikipedia	t
356	Toshiba	toshiba	Japan		brand_logos/toshiba.png	https://www.toshiba.com	wikipedia	t
336	Razer	razer	USA		brand_logos/razer.png	https://www.razer.com	wikipedia	t
355	Patriot	patriot	USA		brand_logos/patriot.svg	https://www.patriot.com	fallback	t
345	DeepCool	deepcool	China		brand_logos/deepcool.png	https://www.deepcool.com	simpleicons	t
357	Keychron	keychron	China		brand_logos/keychron.png	https://www.keychron.com	favicon	t
344	Noctua	noctua	Austria		brand_logos/noctua.png	https://www.noctua.at	favicon	t
376	TWINMOS	twinmos	Taiwan			https://www.twinmos.com	manual	t
346	Arctic	arctic	Germany		brand_logos/arctic.png	https://www.arctic.de	favicon	t
360	Apple	apple	USA		brand_logos/apple.png	https://www.apple.com	wikipedia	t
358	Ducky	ducky	Taiwan		brand_logos/ducky.svg	https://www.duckychannel.com	fallback	t
348	Crucial	crucial	USA		brand_logos/crucial.png	https://www.crucial.com	favicon	t
347	G.Skill	gskill	Taiwan		brand_logos/gskill.png	https://www.gskill.com	favicon	t
377	FORESEE	foresee	China			https://www.foresee.com.cn	manual	t
325	Gigabyte	gigabyte	Taiwan		brand_logos/gigabyte.svg	https://www.gigabyte.com	fallback	t
359	Zowie	zowie	Taiwan		brand_logos/zowie.svg	https://www.zowie.com	fallback	t
332	Kingston	kingston	USA		brand_logos/kingston.svg	https://www.kingston.com	fallback	t
378	Jump	jump	China				manual	t
339	be quiet!	be-quiet	Germany		brand_logos/be-quiet.svg	https://www.bequiet.com	fallback	t
361	Thermalright	thermalright	China		brand_logos/thermalright.svg	https://www.thermalright.com	fallback	t
349	ASRock	asrock	Taiwan		brand_logos/asrock.svg	https://www.asrock.com	fallback	t
362	ADATA	adata	Taiwan			https://www.adata.com	manual	t
350	EVGA	evga	USA		brand_logos/evga.svg	https://www.evga.com	fallback	t
363	DTECH	dtech	China				manual	t
364	TWSC	twsc	China				manual	t
365	A4TECH	a4tech	China			https://www.a4tech.com	manual	t
366	TP-Link	tp-link	China			https://www.tp-link.com	manual	t
367	UNIVIEW	uniview	China			https://www.uniview.com	manual	t
368	DELUX	delux	China			https://www.deluxworld.com	manual	t
369	Canon	canon	Japan			https://www.canon.com	manual	t
370	Microlab	microlab	China			https://www.microlab-global.com	manual	t
371	Share	share	China				manual	t
372	UGREEN	ugreen	China			https://www.ugreen.com	manual	t
373	Aerocool	aerocool	Taiwan			https://www.aerocool.com.tw	manual	t
379	KIOXIA	kioxia	Japan			https://www.kioxia.com	manual	t
380	Genius	genius	Taiwan			https://www.geniusnet.com	manual	t
381	Winstar	winstar	China				manual	t
382	SVEN	sven	Russia			https://www.sven.fi	manual	t
383	X-Game	x-game	China				manual	t
384	MAXSUN	maxsun	China			https://www.maxsun.com.cn	manual	t
385	Philips	philips	Netherlands			https://www.philips.com	manual	t
386	AOC	aoc	China			https://www.aoc.com	manual	t
387	Xiaomi	xiaomi	China			https://www.mi.com	manual	t
388	Defender	defender	Russia			https://defender.ru	manual	t
389	RITMIX	ritmix	Russia			https://ritmixrussia.ru	manual	t
390	Edifier	edifier	China			https://www.edifier.com	manual	t
391	Dahua	dahua	China			https://www.dahuasecurity.com	manual	t
392	Tenda	tenda	China			https://www.tenda.com.cn	manual	t
393	CUDY	cudy	China			https://www.cudy.com	manual	t
394	MikroTik	mikrotik	Latvia			https://mikrotik.com	manual	t
395	Epson	epson	Japan			https://www.epson.com	manual	t
396	ANC	anc	China				manual	t
397	AWP	awp	China				manual	t
398	SVC	svc	China				manual	t
399	ZOTAC	zotac	China			https://www.zotac.com	manual	t
400	Delta	delta	Taiwan			https://www.delta.com	manual	t
401	Dr.Web	dr-web	Russia			https://www.drweb.ru	manual	t
402	Касперский	kaspersky	Russia			https://www.kaspersky.ru	manual	t
403	Brateck	brateck	China			https://www.brateck.com	manual	t
404	Zalman	zalman	South Korea			https://www.zalman.com	manual	t
405	Promate	promate	UAE			https://www.promate.net	manual	t
406	RivaCase	rivacase	Ukraine			https://rivacase.com	manual	t
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_category (id, name, slug, header_order, parent_id, h1, meta_description, meta_title, image, noindex, page_description) FROM stdin;
232	Оптические приводы CD/DVD	opticheskie-privody-cddvd	0	228					f	
233	Сетевые фильтры	setevye-filtry	0	228					f	
234	Флеш-накопители	flesh-nakopiteli	0	228					f	
235	Сетевое оборудование	setevoe-oborudovanie	0	\N					f	
236	Акустика	akustika	0	228					f	
237	Источники бесперебойного питания	istochniki-bespereboynogo-pitaniya	0	228					f	
238	Кронштейны и подставки	kronshteyny-i-podstavki	0	228					f	
239	Офисная мебель	ofisnaya-mebel	0	\N					f	
240	Моноблоки	monobloki	0	209					f	
241	Офисное оборудование	ofisnoe-oborudovanie	0	228					f	
242	Планшеты	planshety	0	\N					f	
243	Охлаждающие подставки	ohlazhdayuschie-podstavki	0	228					f	
208	Охлаждение	cooling	0	199					f	
209	Компьютеры	computers	2	\N					f	
199	Комплектующие	components	1	\N					f	
200	Процессоры	processors	0	199					f	
201	Видеокарты	videocards	0	199					f	
202	Материнские платы	motherboards	0	199					f	
203	Оперативная память	ram	0	199					f	
204	Накопители SSD	ssd	0	199					f	
205	Жёсткие диски	hdd	0	199					f	
206	Блоки питания	psu	0	199					f	
207	Корпуса	cases	0	199					f	
210	Игровые ПК	gaming-pcs	0	209					f	
211	Офисные ПК	office-pcs	0	209					f	
212	Рабочие станции	workstations	0	209					f	
213	Игровые ноутбуки	gaming-laptops	0	209					f	
214	Ультрабуки	ultrabooks	0	209					f	
215	Рабочие ноутбуки	work-laptops	0	209					f	
216	Мониторы	monitors	3	\N					f	
217	Игровые мониторы	gaming-monitors	0	216					f	
218	Профессиональные мониторы	professional-monitors	0	216					f	
219	Офисные мониторы	office-monitors	0	216					f	
220	Периферия	peripherals	4	\N					f	
221	Клавиатуры	keyboards	0	220					f	
222	Мыши	mice	0	220					f	
223	Гарнитуры	headsets	0	220					f	
224	Коврики	mousepads	0	220					f	
225	МФУ и принтеры	mfu-printers	5	\N					f	
226	Цветные МФУ и принтеры	color-mfu-printers	0	225					f	
227	Картриджи, чернила и пр.	cartridges-inks	0	225					f	
228	Аксессуары	accessories	6	\N					f	
229	Кабели и переходники	cables-adapters	0	228					f	
230	Чехлы и сумки	cases-bags	0	228					f	
231	Веб-камеры	webcams	0	228					f	
\.


--
-- Data for Name: products_category_attributes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_category_attributes (id, category_id, attribute_id) FROM stdin;
\.


--
-- Data for Name: products_category_brands; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_category_brands (id, category_id, brand_id) FROM stdin;
\.


--
-- Data for Name: products_certificate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_certificate (id, title, file, sort_order, created_at, product_id) FROM stdin;
\.


--
-- Data for Name: products_discount; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_discount (id, discount_type, value, is_active, start_date, end_date, min_quantity, category_id, product_id, variant_id, promo_campaign_id) FROM stdin;
\.


--
-- Data for Name: products_pricehistory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_pricehistory (id, old_price, new_price, changed_at, reason, product_id, variant_id) FROM stdin;
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_product (id, name, description, price, is_active, is_new, is_favorite, slug, h1, meta_description, meta_title, noindex) FROM stdin;
491	ADATA External USB 3.0\\3.1 (для винчестеров SSD)	Оригинальный ADATA — компьютерный товар. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1245.00	t	f	f	adata-external-usb-3031-dlya-vinchesterov-ssd				f
492	DTECH DT-7032 VGA SWITCH 2*1	Оригинальный DTECH — компьютерный товар. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	445.00	t	f	f	dtech-dt-7032-vga-switch-21				f
493	DTECH аудиоразветвитель T0222 cable L=0.25m	Оригинальный DTECH — компьютерный товар. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	285.00	t	f	f	dtech-audiorazvetvitel-t0222-cable-l025m				f
494	DVD под HDD SLIM SATA (для ноутбуков вместо DVD 9mm SA)	DVD под HDD SLIM SATA (для ноутбуков вместо DVD 9mm SA) — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	805.00	t	f	f	dvd-pod-hdd-slim-sata-dlya-noutbukov-vmesto-dvd-9mm-sa				f
495	USB звуковая карта	USB звуковая карта — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	465.00	t	f	f	usb-zvukovaya-karta				f
496	Внешний адаптер для накопителя UGREEN CM257 (USB3.0 - SATA 2.5\\3.5)	Оригинальный UGREEN — компьютерный товар. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	860.00	t	f	f	vneshniy-adapter-dlya-nakopitelya-ugreen-cm257-usb30-sata-2535				f
497	конвертер Display Port to HDMI	конвертер Display Port to HDMI — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	655.00	t	f	f	konverter-display-port-to-hdmi				f
498	конвертер DVI to HDMI	конвертер DVI to HDMI — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	460.00	t	f	f	konverter-dvi-to-hdmi				f
499	Конвертор HDMI to VGA со звуком	Конвертор HDMI to VGA со звуком — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	820.00	t	f	f	konvertor-hdmi-to-vga-so-zvukom				f
500	Переходник VGA на Display -Port	Переходник VGA на Display -Port — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	470.00	t	f	f	perehodnik-vga-na-display-port				f
501	Переходник DVI на VGA	Переходник DVI на VGA — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	300.00	t	f	f	perehodnik-dvi-na-vga				f
502	Переходник HDMI папа - HDMI мама (Г-образный)	Переходник HDMI папа - HDMI мама (Г-образный) — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	320.00	t	f	f	perehodnik-hdmi-papa-hdmi-mama-g-obraznyy				f
503	Переходник HDMI папа - HDMI мама мини	Переходник HDMI папа - HDMI мама мини — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	450.00	t	f	f	perehodnik-hdmi-papa-hdmi-mama-mini				f
504	Переходник VGA 1 на 2	Переходник VGA 1 на 2 — компьютерный товар. Гарантия до 2 лет, доставка по Караколу.	275.00	t	f	f	perehodnik-vga-1-na-2				f
505	Cable SATA	Cable SATA — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	165.00	t	f	f	cable-sata				f
506	Cable SATA питание	Cable SATA питание — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	170.00	t	f	f	cable-sata-pitanie				f
507	Cable SATA питание II	Cable SATA питание II — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	165.00	t	f	f	cable-sata-pitanie-ii				f
508	Cable USB 1.5 m (удлинитель) экранир	Cable USB 1.5 m (удлинитель) экранир — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	250.00	t	f	f	cable-usb-15-m-udlinitel-ekranir				f
509	Cable USB 3 m (удлинитель) экранир	Cable USB 3 m (удлинитель) экранир — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	315.00	t	f	f	cable-usb-3-m-udlinitel-ekranir				f
510	Cable USB 5 m (удлинитель) экранир	Cable USB 5 m (удлинитель) экранир — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	400.00	t	f	f	cable-usb-5-m-udlinitel-ekranir				f
511	Cable USB экронированный 1,5м	Cable USB экронированный 1,5м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	255.00	t	f	f	cable-usb-ekronirovannyy-15m				f
512	Cable USB экронированный 10м	Cable USB экронированный 10м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	510.00	t	f	f	cable-usb-ekronirovannyy-10m				f
513	Cable USB экронированный 3м	Cable USB экронированный 3м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	300.00	t	f	f	cable-usb-ekronirovannyy-3m				f
514	Cable USB экронированный 5м	Cable USB экронированный 5м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	360.00	t	f	f	cable-usb-ekronirovannyy-5m				f
515	Cable VGA 1.5м	Cable VGA 1.5м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	295.00	t	f	f	cable-vga-15m				f
516	Cable VGA 10м	Cable VGA 10м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	700.00	t	f	f	cable-vga-10m				f
517	Cable VGA 20м	Cable VGA 20м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	1025.00	t	f	f	cable-vga-20m				f
518	Cable VGA 3м	Cable VGA 3м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	340.00	t	f	f	cable-vga-3m				f
519	Cable VGA 5м	Cable VGA 5м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	440.00	t	f	f	cable-vga-5m				f
520	Power cable	Power cable — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	180.00	t	f	f	power-cable				f
521	Power cable 1,5м черный	Power cable 1,5м черный — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	200.00	t	f	f	power-cable-15m-chernyy				f
522	Power cable 1м черный	Power cable 1м черный — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	180.00	t	f	f	power-cable-1m-chernyy				f
523	Power cable for monitor	Power cable for monitor — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	135.00	t	f	f	power-cable-for-monitor				f
524	Power cable for monitor 1.8 белый	Power cable for monitor 1.8 белый — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	230.00	t	f	f	power-cable-for-monitor-18-belyy				f
525	Кабель DPI 1.5 м	Кабель DPI 1.5 м — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	195.00	t	f	f	kabel-dpi-15-m				f
526	Кабель HDMI - HDMI 1.5 m	Кабель HDMI - HDMI 1.5 m — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	345.00	t	f	f	kabel-hdmi-hdmi-15-m				f
527	Кабель HDMI - HDMI 10m	Кабель HDMI - HDMI 10m — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	855.00	t	f	f	kabel-hdmi-hdmi-10m				f
528	Кабель HDMI - HDMI 15m	Кабель HDMI - HDMI 15m — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	1310.00	t	f	f	kabel-hdmi-hdmi-15m				f
529	Кабель HDMI - HDMI 20m	Кабель HDMI - HDMI 20m — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	1480.00	t	f	f	kabel-hdmi-hdmi-20m				f
530	Кабель HDMI - HDMI 3 m	Кабель HDMI - HDMI 3 m — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	415.00	t	f	f	kabel-hdmi-hdmi-3-m				f
531	Кабель HDMI - HDMI 5 m	Кабель HDMI - HDMI 5 m — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	440.00	t	f	f	kabel-hdmi-hdmi-5-m				f
532	Кабель USB-C - HDMI 1.5 m UGREEN MM142	Оригинальный UGREEN — кабель и переходник. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1365.00	t	f	f	kabel-usb-c-hdmi-15-m-ugreen-mm142				f
533	Кабель питания Видео карты	Кабель питания Видео карты — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	155.00	t	f	f	kabel-pitaniya-video-karty				f
534	Провод для ноутбука 2 дырки	Провод для ноутбука 2 дырки — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	265.00	t	f	f	provod-dlya-noutbuka-2-dyrki				f
535	Провод для ноутбука 3 дырки	Провод для ноутбука 3 дырки — кабель и переходник. Гарантия до 2 лет, доставка по Караколу.	350.00	t	f	f	provod-dlya-noutbuka-3-dyrki				f
536	ATX DELUX DLC-DW601 Black	Оригинальный DELUX — корпус для ПК. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1855.00	t	f	f	atx-delux-dlc-dw601-black				f
538	DEEPCOOL MATX MATREXX 30 w/o PSU 1*USB 3.0 Glass front panel Fully bl	Оригинальный DeepCool — корпус для ПК. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2700.00	t	f	f	deepcool-matx-matrexx-30-wo-psu-1usb-30-glass-front-panel-fully-bl				f
539	DEEPCOOL MATX MATREXX 55 w/o PSU 1*USB 3.0	Оригинальный DeepCool — корпус для ПК. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4440.00	t	f	f	deepcool-matx-matrexx-55-wo-psu-1usb-30				f
540	Корпус Aerocool Viewport Mini-G-BK-v1, Micro ATX/mini-ITX, USB 3.0/2*2	Оригинальный Aerocool — корпус для ПК. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4020.00	t	f	f	korpus-aerocool-viewport-mini-g-bk-v1-micro-atxmini-itx-usb-3022				f
541	Корпус Aeromax WSC-3155 Black with USB	Оригинальный Aeromax — корпус для ПК. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1600.00	t	f	f	korpus-aeromax-wsc-3155-black-with-usb				f
542	Корпус Aeromax WSC-6011\\6012 Black with USB 2,0	Оригинальный Aeromax — корпус для ПК. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1395.00	t	f	f	korpus-aeromax-wsc-60116012-black-with-usb-20				f
543	DVD±RW&CDRW 22X Black SATA - для тендера	DVD±RW&CDRW 22X Black SATA - для тендера — оптический привод. Гарантия до 2 лет, доставка по Караколу.	405.00	t	f	f	dvdrwcdrw-22x-black-sata-dlya-tendera				f
544	Cooler 12 см с подсветкой	Cooler 12 см с подсветкой — система охлаждения компьютера. Гарантия до 2 лет, доставка по Караколу.	430.00	t	f	f	cooler-12-sm-s-podsvetkoy				f
545	Cooler 80х25	Cooler 80х25 — система охлаждения компьютера. Гарантия до 2 лет, доставка по Караколу.	290.00	t	f	f	cooler-80h25				f
546	Cooler for PSU/CASE DEEPCOOL RF120 BLUE LED	Оригинальный DeepCool — система охлаждения компьютера. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	385.00	t	f	f	cooler-for-psucase-deepcool-rf120-blue-led				f
547	Cooler P1	Cooler P1 — система охлаждения компьютера. Гарантия до 2 лет, доставка по Караколу.	175.00	t	f	f	cooler-p1				f
395	Intel Core i9-14900K	Intel Core i9-14900K — отличный выбор для сборки или апгрейда вашего ПК.	48500.00	t	f	t	intel-core-i9-14900k				f
396	Intel Core i7-14700K	Intel Core i7-14700K — отличный выбор для сборки или апгрейда вашего ПК.	34200.00	t	f	f	intel-core-i7-14700k				f
397	Intel Core i5-14600K	Intel Core i5-14600K — отличный выбор для сборки или апгрейда вашего ПК.	27500.00	t	f	f	intel-core-i5-14600k				f
398	Intel Core i3-14100F	Intel Core i3-14100F — отличный выбор для сборки или апгрейда вашего ПК.	12400.00	t	t	f	intel-core-i3-14100f				f
399	AMD Ryzen 9 7950X3D	AMD Ryzen 9 7950X3D — отличный выбор для сборки или апгрейда вашего ПК.	57800.00	t	f	t	amd-ryzen-9-7950x3d				f
400	AMD Ryzen 7 7800X3D	AMD Ryzen 7 7800X3D — отличный выбор для сборки или апгрейда вашего ПК.	33800.00	t	f	t	amd-ryzen-7-7800x3d				f
401	AMD Ryzen 5 7600X	AMD Ryzen 5 7600X — отличный выбор для сборки или апгрейда вашего ПК.	21800.00	t	f	f	amd-ryzen-5-7600x				f
402	AMD Ryzen 9 9950X	AMD Ryzen 9 9950X — отличный выбор для сборки или апгрейда вашего ПК.	62400.00	t	t	f	amd-ryzen-9-9950x				f
403	NVIDIA GeForce RTX 4090	NVIDIA GeForce RTX 4090 — отличный выбор для сборки или апгрейда вашего ПК.	158000.00	t	f	t	nvidia-geforce-rtx-4090				f
404	NVIDIA GeForce RTX 4080 Super	NVIDIA GeForce RTX 4080 Super — отличный выбор для сборки или апгрейда вашего ПК.	82600.00	t	f	f	nvidia-geforce-rtx-4080-super				f
405	NVIDIA GeForce RTX 4070 Super	NVIDIA GeForce RTX 4070 Super — отличный выбор для сборки или апгрейда вашего ПК.	54200.00	t	f	f	nvidia-geforce-rtx-4070-super				f
406	NVIDIA GeForce RTX 4060 Ti	NVIDIA GeForce RTX 4060 Ti — отличный выбор для сборки или апгрейда вашего ПК.	36400.00	t	f	f	nvidia-geforce-rtx-4060-ti				f
407	AMD Radeon RX 7900 XTX	AMD Radeon RX 7900 XTX — отличный выбор для сборки или апгрейда вашего ПК.	74800.00	t	f	f	amd-radeon-rx-7900-xtx				f
408	AMD Radeon RX 7800 XT	AMD Radeon RX 7800 XT — отличный выбор для сборки или апгрейда вашего ПК.	41600.00	t	f	f	amd-radeon-rx-7800-xt				f
409	AMD Radeon RX 7600	AMD Radeon RX 7600 — отличный выбор для сборки или апгрейда вашего ПК.	24800.00	t	t	f	amd-radeon-rx-7600				f
410	Intel Arc A770 16GB	Intel Arc A770 16GB — отличный выбор для сборки или апгрейда вашего ПК.	27600.00	t	t	f	intel-arc-a770-16gb				f
411	ASUS ROG STRIX Z790-F Gaming WiFi	ASUS ROG STRIX Z790-F Gaming WiFi — отличный выбор для сборки или апгрейда вашего ПК.	34200.00	t	f	f	asus-rog-strix-z790-f-gaming-wifi				f
412	Gigabyte Z790 AORUS Elite AX	Gigabyte Z790 AORUS Elite AX — отличный выбор для сборки или апгрейда вашего ПК.	25800.00	t	f	f	gigabyte-z790-aorus-elite-ax				f
413	ASUS TUF Gaming B760-PLUS WiFi	ASUS TUF Gaming B760-PLUS WiFi — отличный выбор для сборки или апгрейда вашего ПК.	18300.00	t	f	f	asus-tuf-gaming-b760-plus-wifi				f
414	MSI MAG B650 TOMAHAWK WiFi	MSI MAG B650 TOMAHAWK WiFi — отличный выбор для сборки или апгрейда вашего ПК.	19800.00	t	f	f	msi-mag-b650-tomahawk-wifi				f
415	ASRock B650M Pro RS WiFi	ASRock B650M Pro RS WiFi — отличный выбор для сборки или апгрейда вашего ПК.	14200.00	t	t	f	asrock-b650m-pro-rs-wifi				f
416	MSI MPG X670E Carbon WiFi	MSI MPG X670E Carbon WiFi — отличный выбор для сборки или апгрейда вашего ПК.	43200.00	t	f	f	msi-mpg-x670e-carbon-wifi				f
417	Gigabyte B550 AORUS Elite V2	Gigabyte B550 AORUS Elite V2 — отличный выбор для сборки или апгрейда вашего ПК.	12800.00	t	f	f	gigabyte-b550-aorus-elite-v2				f
418	ASUS ROG Crosshair X670E Hero	ASUS ROG Crosshair X670E Hero — отличный выбор для сборки или апгрейда вашего ПК.	58600.00	t	f	f	asus-rog-crosshair-x670e-hero				f
419	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz — отличный выбор для сборки или апгрейда вашего ПК.	9600.00	t	f	f	kingston-fury-beast-ddr5-32gb-2x16-5600mhz				f
420	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB — отличный выбор для сборки или апгрейда вашего ПК.	10200.00	t	f	f	corsair-vengeance-ddr5-32gb-2x16-6000mhz-rgb				f
421	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz — отличный выбор для сборки или апгрейда вашего ПК.	11800.00	t	t	f	gskill-trident-z5-rgb-ddr5-32gb-2x16-6400mhz				f
422	Crucial Pro DDR5 32GB (2×16GB) 5600MHz	Crucial Pro DDR5 32GB (2×16GB) 5600MHz — отличный выбор для сборки или апгрейда вашего ПК.	8400.00	t	f	f	crucial-pro-ddr5-32gb-2x16-5600mhz				f
423	Crucial Pro DDR4 32GB (2×16GB) 3200MHz	Crucial Pro DDR4 32GB (2×16GB) 3200MHz — отличный выбор для сборки или апгрейда вашего ПК.	6200.00	t	f	f	crucial-pro-ddr4-32gb-2x16-3200mhz				f
424	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz — отличный выбор для сборки или апгрейда вашего ПК.	21600.00	t	t	f	teamgroup-t-force-delta-rgb-ddr5-64gb-2x32-6000mhz				f
425	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz — отличный выбор для сборки или апгрейда вашего ПК.	4200.00	t	f	f	patriot-viper-steel-ddr4-16gb-2x8-3600mhz				f
426	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz — отличный выбор для сборки или апгрейда вашего ПК.	13400.00	t	f	f	kingston-fury-renegade-ddr5-32gb-2x16-7200mhz				f
427	Samsung 990 PRO 2TB NVMe M.2	Samsung 990 PRO 2TB NVMe M.2 — отличный выбор для сборки или апгрейда вашего ПК.	15600.00	t	f	f	samsung-990-pro-2tb-nvme-m2				f
428	WD Black SN850X 1TB NVMe M.2	WD Black SN850X 1TB NVMe M.2 — отличный выбор для сборки или апгрейда вашего ПК.	8300.00	t	f	f	wd-black-sn850x-1tb-nvme-m2				f
429	Kingston KC3000 2TB NVMe M.2	Kingston KC3000 2TB NVMe M.2 — отличный выбор для сборки или апгрейда вашего ПК.	13200.00	t	f	f	kingston-kc3000-2tb-nvme-m2				f
430	Crucial T700 1TB NVMe M.2 PCIe 5.0	Crucial T700 1TB NVMe M.2 PCIe 5.0 — отличный выбор для сборки или апгрейда вашего ПК.	14200.00	t	t	f	crucial-t700-1tb-nvme-m2-pcie-5				f
431	Samsung 870 EVO 1TB SATA 2.5"	Samsung 870 EVO 1TB SATA 2.5" — отличный выбор для сборки или апгрейда вашего ПК.	7200.00	t	f	f	samsung-870-evo-1tb-sata-25				f
432	WD Blue SN580 1TB NVMe M.2	WD Blue SN580 1TB NVMe M.2 — отличный выбор для сборки или апгрейда вашего ПК.	5800.00	t	f	f	wd-blue-sn580-1tb-nvme-m2				f
433	Seagate BarraCuda 4TB HDD 3.5"	Seagate BarraCuda 4TB HDD 3.5" — отличный выбор для сборки или апгрейда вашего ПК.	6900.00	t	f	f	seagate-barracuda-4tb-hdd-35				f
434	WD Red Plus 8TB NAS HDD 3.5"	WD Red Plus 8TB NAS HDD 3.5" — отличный выбор для сборки или апгрейда вашего ПК.	16800.00	t	t	f	wd-red-plus-8tb-nas-hdd-35				f
435	Toshiba N300 12TB NAS HDD 3.5"	Toshiba N300 12TB NAS HDD 3.5" — отличный выбор для сборки или апгрейда вашего ПК.	23400.00	t	f	f	toshiba-n300-12tb-nas-hdd-35				f
436	Seagate IronWolf 4TB NAS HDD 3.5"	Seagate IronWolf 4TB NAS HDD 3.5" — отличный выбор для сборки или апгрейда вашего ПК.	8600.00	t	f	f	seagate-ironwolf-4tb-nas-hdd-35				f
437	Corsair RM850x (2024) 850W 80+ Gold	Corsair RM850x (2024) 850W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	11200.00	t	f	f	corsair-rm850x-2024-850w-80plus-gold				f
438	be quiet! Dark Power 13 1000W 80+ Titanium	be quiet! Dark Power 13 1000W 80+ Titanium — отличный выбор для сборки или апгрейда вашего ПК.	22600.00	t	f	t	be-quiet-dark-power-13-1000w-80plus-titanium				f
439	Seasonic Focus GX-750 750W 80+ Gold	Seasonic Focus GX-750 750W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	8900.00	t	f	f	seasonic-focus-gx-750-750w-80plus-gold				f
440	Cooler Master MWE Gold 650 V2 650W 80+ Gold	Cooler Master MWE Gold 650 V2 650W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	6500.00	t	f	f	cooler-master-mwe-gold-650-v2-650w-80plus-gold				f
441	EVGA SuperNOVA 850 GT 850W 80+ Gold	EVGA SuperNOVA 850 GT 850W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	10300.00	t	f	f	evga-supernova-850-gt-850w-80plus-gold				f
442	Corsair RM750e 750W 80+ Gold	Corsair RM750e 750W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	8200.00	t	f	f	corsair-rm750e-750w-80plus-gold				f
443	DeepCool PQ1000M 1000W 80+ Gold	DeepCool PQ1000M 1000W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	12700.00	t	t	f	deepcool-pq1000m-1000w-80plus-gold				f
444	be quiet! Pure Power 12 M 750W 80+ Gold	be quiet! Pure Power 12 M 750W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	9600.00	t	f	f	be-quiet-pure-power-12-m-750w-80plus-gold				f
445	Cooler Master MasterBox TD500 Mesh V2	Cooler Master MasterBox TD500 Mesh V2 — отличный выбор для сборки или апгрейда вашего ПК.	8200.00	t	f	f	cooler-master-masterbox-td500-mesh-v2				f
446	Fractal Design North Charcoal Black	Fractal Design North Charcoal Black — отличный выбор для сборки или апгрейда вашего ПК.	12400.00	t	t	f	fractal-design-north-charcoal-black				f
447	NZXT H7 Flow	NZXT H7 Flow — отличный выбор для сборки или апгрейда вашего ПК.	10800.00	t	f	f	nzxt-h7-flow				f
448	Corsair 4000D Airflow	Corsair 4000D Airflow — отличный выбор для сборки или апгрейда вашего ПК.	8200.00	t	f	f	corsair-4000d-airflow				f
449	Lian Li O11 Dynamic EVO	Lian Li O11 Dynamic EVO — отличный выбор для сборки или апгрейда вашего ПК.	14800.00	t	f	t	lian-li-o11-dynamic-evo				f
450	be quiet! Silent Base 802	be quiet! Silent Base 802 — отличный выбор для сборки или апгрейда вашего ПК.	13500.00	t	f	f	be-quiet-silent-base-802				f
451	Noctua NH-D15 chromax.black	Noctua NH-D15 chromax.black — отличный выбор для сборки или апгрейда вашего ПК.	9200.00	t	f	t	noctua-nh-d15-chromax-black				f
452	DeepCool AK620	DeepCool AK620 — отличный выбор для сборки или апгрейда вашего ПК.	5400.00	t	f	f	deepcool-ak620				f
453	be quiet! Dark Rock Pro 4	be quiet! Dark Rock Pro 4 — отличный выбор для сборки или апгрейда вашего ПК.	7800.00	t	f	f	be-quiet-dark-rock-pro-4				f
454	Arctic Liquid Freezer II 360	Arctic Liquid Freezer II 360 — отличный выбор для сборки или апгрейда вашего ПК.	9600.00	t	f	f	arctic-liquid-freezer-ii-360				f
455	Corsair iCUE H150i Elite LCD XT	Corsair iCUE H150i Elite LCD XT — отличный выбор для сборки или апгрейда вашего ПК.	18200.00	t	f	f	corsair-icue-h150i-elite-lcd-xt				f
456	Cooler Master Hyper 212 Halo Black	Cooler Master Hyper 212 Halo Black — отличный выбор для сборки или апгрейда вашего ПК.	3200.00	t	f	f	cooler-master-hyper-212-halo-black				f
457	NZXT Kraken X63 RGB 280mm	NZXT Kraken X63 RGB 280mm — отличный выбор для сборки или апгрейда вашего ПК.	14200.00	t	f	f	nzxt-kraken-x63-rgb-280mm				f
458	Thermalright Peerless Assassin 120 SE	Thermalright Peerless Assassin 120 SE — отличный выбор для сборки или апгрейда вашего ПК.	3800.00	t	f	f	thermalright-peerless-assassin-120-se				f
459	Samsung Odyssey G7 27" QHD 240Hz Curved	Samsung Odyssey G7 27" QHD 240Hz Curved — отличный выбор для сборки или апгрейда вашего ПК.	43200.00	t	f	f	samsung-odyssey-g7-27-qhd-240hz-curved				f
460	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS — отличный выбор для сборки или апгрейда вашего ПК.	34600.00	t	f	f	lg-ultragear-27gp850-b-27-qhd-165hz-nano-ips				f
461	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED — отличный выбор для сборки или апгрейда вашего ПК.	112000.00	t	f	t	asus-rog-swift-pg32ucdm-32-4k-240hz-oled				f
462	Dell S2722QC 27" 4K 60Hz IPS	Dell S2722QC 27" 4K 60Hz IPS — отличный выбор для сборки или апгрейда вашего ПК.	28600.00	t	f	f	dell-s2722qc-27-4k-60hz-ips				f
463	Gigabyte M27Q 27" QHD 170Hz IPS	Gigabyte M27Q 27" QHD 170Hz IPS — отличный выбор для сборки или апгрейда вашего ПК.	26800.00	t	f	f	gigabyte-m27q-27-qhd-170hz-ips				f
464	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor — отличный выбор для сборки или апгрейда вашего ПК.	38400.00	t	f	f	benq-pd2705u-27-4k-60hz-ips-designer				f
465	ASUS ProArt PA278QV 27" QHD 75Hz IPS	ASUS ProArt PA278QV 27" QHD 75Hz IPS — отличный выбор для сборки или апгрейда вашего ПК.	26400.00	t	f	f	asus-proart-pa278qv-27-qhd-75hz-ips				f
466	LG 27GN950-B 27" 4K 144Hz Nano IPS	LG 27GN950-B 27" 4K 144Hz Nano IPS — отличный выбор для сборки или апгрейда вашего ПК.	62400.00	t	t	f	lg-27gn950-b-27-4k-144hz-nano-ips				f
467	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070 — отличный выбор для сборки или апгрейда вашего ПК.	154000.00	t	f	t	asus-rog-zephyrus-g16-2025-ultra9-rtx4070				f
468	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060 — отличный выбор для сборки или апгрейда вашего ПК.	132000.00	t	f	f	lenovo-legion-pro-5-16irx9-i9-rtx4060				f
469	Acer Predator Helios 16 16" i7 / RTX 4070	Acer Predator Helios 16 16" i7 / RTX 4070 — отличный выбор для сборки или апгрейда вашего ПК.	126000.00	t	t	f	acer-predator-helios-16-i7-rtx4070				f
470	Apple MacBook Pro 16" M4 Pro	Apple MacBook Pro 16" M4 Pro — отличный выбор для сборки или апгрейда вашего ПК.	224000.00	t	f	t	apple-macbook-pro-16-m4-pro				f
471	Apple MacBook Air 15" M4	Apple MacBook Air 15" M4 — отличный выбор для сборки или апгрейда вашего ПК.	118000.00	t	t	f	apple-macbook-air-15-m4				f
472	Dell XPS 15 9530 15.6" i7 / RTX 4060	Dell XPS 15 9530 15.6" i7 / RTX 4060 — отличный выбор для сборки или апгрейда вашего ПК.	148000.00	t	f	f	dell-xps-15-9530-i7-rtx4060				f
473	HP Spectre x360 16" Ultra 7 / Intel Arc	HP Spectre x360 16" Ultra 7 / Intel Arc — отличный выбор для сборки или апгрейда вашего ПК.	132000.00	t	f	f	hp-spectre-x360-16-ultra7-intel-arc				f
474	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7 — отличный выбор для сборки или апгрейда вашего ПК.	168000.00	t	f	f	lenovo-thinkpad-x1-carbon-gen12-ultra7				f
475	Logitech G Pro X Superlight 2	Logitech G Pro X Superlight 2 — отличный выбор для сборки или апгрейда вашего ПК.	12400.00	t	f	t	logitech-g-pro-x-superlight-2				f
476	Razer DeathAdder V3 Pro	Razer DeathAdder V3 Pro — отличный выбор для сборки или апгрейда вашего ПК.	13100.00	t	f	f	razer-deathadder-v3-pro				f
477	Logitech G502 X Plus	Logitech G502 X Plus — отличный выбор для сборки или апгрейда вашего ПК.	11600.00	t	f	f	logitech-g502-x-plus				f
478	Razer Basilisk V3 Pro	Razer Basilisk V3 Pro — отличный выбор для сборки или апгрейда вашего ПК.	14800.00	t	f	f	razer-basilisk-v3-pro				f
479	SteelSeries Rival 5	SteelSeries Rival 5 — отличный выбор для сборки или апгрейда вашего ПК.	5400.00	t	f	f	steelseries-rival-5				f
480	Zowie EC2-C	Zowie EC2-C — отличный выбор для сборки или апгрейда вашего ПК.	6800.00	t	f	f	zowie-ec2-c				f
481	SteelSeries Apex Pro TKL (2025) Wireless	SteelSeries Apex Pro TKL (2025) Wireless — отличный выбор для сборки или апгрейда вашего ПК.	18900.00	t	f	f	steelseries-apex-pro-tkl-2025-wireless				f
482	Razer BlackWidow V4 Pro	Razer BlackWidow V4 Pro — отличный выбор для сборки или апгрейда вашего ПК.	17400.00	t	f	f	razer-blackwidow-v4-pro				f
483	Logitech G915 TKL Wireless	Logitech G915 TKL Wireless — отличный выбор для сборки или апгрейда вашего ПК.	16800.00	t	f	f	logitech-g915-tkl-wireless				f
484	Keychron Q1 Pro QMK/VIA Wireless	Keychron Q1 Pro QMK/VIA Wireless — отличный выбор для сборки или апгрейда вашего ПК.	14200.00	t	t	f	keychron-q1-pro-qmk-via-wireless				f
485	Ducky One 3 Classic TKL	Ducky One 3 Classic TKL — отличный выбор для сборки или апгрейда вашего ПК.	9600.00	t	f	f	ducky-one-3-classic-tkl				f
486	Corsair K70 RGB Pro	Corsair K70 RGB Pro — отличный выбор для сборки или апгрейда вашего ПК.	12800.00	t	f	f	corsair-k70-rgb-pro				f
487	HyperX Cloud III Wireless	HyperX Cloud III Wireless — отличный выбор для сборки или апгрейда вашего ПК.	13200.00	t	f	f	hyperx-cloud-iii-wireless				f
488	SteelSeries Arctis Nova Pro Wireless	SteelSeries Arctis Nova Pro Wireless — отличный выбор для сборки или апгрейда вашего ПК.	28600.00	t	f	t	steelseries-arctis-nova-pro-wireless				f
489	Razer BlackShark V2 Pro (2024)	Razer BlackShark V2 Pro (2024) — отличный выбор для сборки или апгрейда вашего ПК.	16800.00	t	t	f	razer-blackshark-v2-pro-2024				f
490	Logitech G Pro X 2 Lightspeed	Logitech G Pro X 2 Lightspeed — отличный выбор для сборки или апгрейда вашего ПК.	19600.00	t	f	f	logitech-g-pro-x-2-lightspeed				f
537	ATX mini DELUX DLC-DW601 Black	Оригинальный DELUX — корпус для ПК. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1420.00	t	f	f	atx-mini-delux-dlc-dw601-black				f
548	Cooler P3	Cooler P3 — система охлаждения компьютера. Гарантия до 2 лет, доставка по Караколу.	190.00	t	f	f	cooler-p3				f
549	Cooler P4	Cooler P4 — система охлаждения компьютера. Гарантия до 2 лет, доставка по Караколу.	190.00	t	f	f	cooler-p4				f
550	CPU cooler DEEPCOOL ALTA-9 - 775 сокета	Оригинальный DeepCool — система охлаждения компьютера. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	560.00	t	f	f	cpu-cooler-deepcool-alta-9-775-soketa				f
551	CPU cooler DEEPCOOL THETA-15 1700	Оригинальный DeepCool — система охлаждения компьютера. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	675.00	t	f	f	cpu-cooler-deepcool-theta-15-1700				f
552	CPU cooler DEEPCOOL THETA-21 1100-3200rpm	Оригинальный DeepCool — система охлаждения компьютера. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	740.00	t	f	f	cpu-cooler-deepcool-theta-21-1100-3200rpm				f
553	CPU cooler DEEPCOOL THETA-31	Оригинальный DeepCool — система охлаждения компьютера. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	885.00	t	f	f	cpu-cooler-deepcool-theta-31				f
554	Кулер для процессора for Intel LGA1700/1200/1156/1155/1151/1150 ORIGIN	Оригинальный Intel — система охлаждения компьютера. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	485.00	t	f	f	kuler-dlya-protsessora-for-intel-lga170012001156115511511150-origin				f
555	Cетевой фильтр Эксперт - 3розетки 3м	Cетевой фильтр Эксперт - 3розетки 3м — сетевой фильтр. Гарантия до 2 лет, доставка по Караколу.	300.00	t	f	f	cetevoy-filtr-ekspert-3rozetki-3m				f
556	Cетевой фильтр Эксперт - 3розетки 5м	Cетевой фильтр Эксперт - 3розетки 5м — сетевой фильтр. Гарантия до 2 лет, доставка по Караколу.	355.00	t	f	f	cetevoy-filtr-ekspert-3rozetki-5m				f
557	Cетевой фильтр Эксперт - 6 розеток 3м	Cетевой фильтр Эксперт - 6 розеток 3м — сетевой фильтр. Гарантия до 2 лет, доставка по Караколу.	580.00	t	f	f	cetevoy-filtr-ekspert-6-rozetok-3m				f
558	Cетевой фильтр Эксперт - 6 розеток 5м	Cетевой фильтр Эксперт - 6 розеток 5м — сетевой фильтр. Гарантия до 2 лет, доставка по Караколу.	605.00	t	f	f	cetevoy-filtr-ekspert-6-rozetok-5m				f
559	Filter Ritech 5м 3 розетки	Filter Ritech 5м 3 розетки — сетевой фильтр. Гарантия до 2 лет, доставка по Караколу.	950.00	t	f	f	filter-ritech-5m-3-rozetki				f
560	Сетевой фильтр ЭРА базовая защита 5гн 5 м ПВС 10А с/з с выкл белый\\чер	Сетевой фильтр ЭРА базовая защита 5гн 5 м ПВС 10А с/з с выкл белый\\чер — сетевой фильтр. Гарантия до 2 лет, доставка по Караколу.	970.00	t	f	f	setevoy-filtr-era-bazovaya-zaschita-5gn-5-m-pvs-10a-sz-s-vykl-belyycher				f
561	Сетевой фильтр ЭРА базовая защита 6гн 3 м ПВС 10А с/з с выкл белый\\чер	Сетевой фильтр ЭРА базовая защита 6гн 3 м ПВС 10А с/з с выкл белый\\чер — сетевой фильтр. Гарантия до 2 лет, доставка по Караколу.	945.00	t	f	f	setevoy-filtr-era-bazovaya-zaschita-6gn-3-m-pvs-10a-sz-s-vykl-belyycher				f
562	PEN DRIVE 128GB USB 3.1\\3.2	PEN DRIVE 128GB USB 3.1\\3.2 — карта памяти или USB-флеш-накопитель. Гарантия до 2 лет, доставка по Караколу.	1205.00	t	f	f	pen-drive-128gb-usb-3132				f
563	PEN DRIVE 256GB USB 3.1\\3.2	PEN DRIVE 256GB USB 3.1\\3.2 — карта памяти или USB-флеш-накопитель. Гарантия до 2 лет, доставка по Караколу.	2435.00	t	f	f	pen-drive-256gb-usb-3132				f
564	PEN DRIVE 64GB USB 2,0	PEN DRIVE 64GB USB 2,0 — карта памяти или USB-флеш-накопитель. Гарантия до 2 лет, доставка по Караколу.	635.00	t	f	f	pen-drive-64gb-usb-20				f
565	PEN DRIVE 64GB USB 3.0\\3.1\\3,2	PEN DRIVE 64GB USB 3.0\\3.1\\3,2 — карта памяти или USB-флеш-накопитель. Гарантия до 2 лет, доставка по Караколу.	790.00	t	f	f	pen-drive-64gb-usb-303132				f
566	Secure Digital Card micro 128MB	Secure Digital Card micro 128MB — карта памяти или USB-флеш-накопитель. Гарантия до 2 лет, доставка по Караколу.	1785.00	t	f	f	secure-digital-card-micro-128mb				f
567	Secure Digital Card micro 128MB kingston	Оригинальный Kingston — карта памяти или USB-флеш-накопитель. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1555.00	t	f	f	secure-digital-card-micro-128mb-kingston				f
568	Secure Digital Card micro 256MB	Secure Digital Card micro 256MB — карта памяти или USB-флеш-накопитель. Гарантия до 2 лет, доставка по Караколу.	2920.00	t	f	f	secure-digital-card-micro-256mb				f
569	Secure Digital Card micro 32GB	Secure Digital Card micro 32GB — карта памяти или USB-флеш-накопитель. Гарантия до 2 лет, доставка по Караколу.	615.00	t	f	f	secure-digital-card-micro-32gb				f
570	Secure Digital Card micro 512MB	Secure Digital Card micro 512MB — карта памяти или USB-флеш-накопитель. Гарантия до 2 лет, доставка по Караколу.	5260.00	t	f	f	secure-digital-card-micro-512mb				f
571	Secure Digital Card micro 64GB	Secure Digital Card micro 64GB — карта памяти или USB-флеш-накопитель. Гарантия до 2 лет, доставка по Караколу.	1020.00	t	f	f	secure-digital-card-micro-64gb				f
572	External HDD 1TB ADATA XPG EX500 (5400RPM, USB 3.1)	Оригинальный ADATA — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	6120.00	t	f	f	external-hdd-1tb-adata-xpg-ex500-5400rpm-usb-31				f
573	HDD 1000GB 5400rpm WD\\Seagate SATA	HDD 1000GB 5400rpm WD\\Seagate SATA — накопитель данных. Гарантия до 2 лет, доставка по Караколу.	4820.00	t	f	f	hdd-1000gb-5400rpm-wdseagate-sata				f
574	HDD 1TB, Toshiba, 7200rpm, 64MB Cache	HDD 1TB, Toshiba, 7200rpm, 64MB Cache — накопитель данных. Гарантия до 2 лет, доставка по Караколу.	6920.00	t	f	f	hdd-1tb-toshiba-7200rpm-64mb-cache				f
575	SSD HIKVISION E1000(STD) 128GB 3D NAND M.2	Оригинальный HIKVISION — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2545.00	t	f	f	ssd-hikvision-e1000std-128gb-3d-nand-m2				f
576	SSD HIKVISION E3000(STD) 256GB 3D NAND M.2	Оригинальный HIKVISION — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	5075.00	t	f	f	ssd-hikvision-e3000std-256gb-3d-nand-m2				f
577	SSD HIKVISION HS-SSD-C100 120GB TLC 2,5"" SATAIII	Оригинальный HIKVISION — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3125.00	t	f	f	ssd-hikvision-hs-ssd-c100-120gb-tlc-25-sataiii				f
578	SSD HIKVISION HS-SSD-C100 240GB TLC 2,5""	Оригинальный HIKVISION — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4315.00	t	f	f	ssd-hikvision-hs-ssd-c100-240gb-tlc-25				f
579	SSD HIKVISION HS-SSD-C100 480GB TLC 2,5"" SATAIII	Оригинальный HIKVISION — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	6410.00	t	f	f	ssd-hikvision-hs-ssd-c100-480gb-tlc-25-sataiii				f
580	SSD TWINMOS AlphaPRO 128GB 3D NAND M.2	Оригинальный TWINMOS — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2620.00	t	f	f	ssd-twinmos-alphapro-128gb-3d-nand-m2				f
581	SSD 128GB FORESEE M.2 2280 NVME	Оригинальный FORESEE — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2960.00	t	f	f	ssd-128gb-foresee-m2-2280-nvme				f
582	SSD 512GB Jump DS 2.5" SATA3 B чтение/запись 550/500MB/s	Оригинальный Jump — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	7290.00	t	f	f	ssd-512gb-jump-ds-25-sata3-b-chteniezapis-550500mbs				f
583	SSD 512GB Western Digital PC SN5000S M.2 2280 NVMe PCIe Gen4x4 Read ,	Оригинальный Western Digital — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	8205.00	t	f	f	ssd-512gb-western-digital-pc-sn5000s-m2-2280-nvme-pcie-gen4x4-read				f
584	SSD KIOXIA (Toshiba) BG6 512GB PCIe NVMe Gen4x4, M.2 2280	Оригинальный KIOXIA — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	8845.00	t	f	f	ssd-kioxia-toshiba-bg6-512gb-pcie-nvme-gen4x4-m2-2280				f
585	TWSC 256GB PCIe NVMe Gen4x4, M.2 2280, RW Speed up to 3400/2600MB/s	Оригинальный TWSC — накопитель данных. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3580.00	t	f	f	twsc-256gb-pcie-nvme-gen4x4-m2-2280-rw-speed-up-to-34002600mbs				f
586	A4TECH KK-3330 (KK-3+OP-330) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1170.00	t	f	f	a4tech-kk-3330-kk-3op-330-keyboardmouse-set-usb-black-usrussian				f
587	A4TECH KR-8372 (KR-83+OP-720) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1245.00	t	f	f	a4tech-kr-8372-kr-83op-720-keyboardmouse-set-usb-black-usrussian				f
588	A4TECH KR-8572 (KR-85+OP-720) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1255.00	t	f	f	a4tech-kr-8572-kr-85op-720-keyboardmouse-set-usb-black-usrussian				f
589	A4TECH BLOODY B135N GAMING NEON BACKLIGHT MULTIMEDIA KEYBOARD USB	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1550.00	t	f	f	a4tech-bloody-b135n-gaming-neon-backlight-multimedia-keyboard-usb				f
590	A4TECH BLOODY B318 LIGHT STRIKE GAMING 8 IR MICRO-SWITCH KEYBOARD USB	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2575.00	t	f	f	a4tech-bloody-b318-light-strike-gaming-8-ir-micro-switch-keyboard-usb				f
591	A4TECH BLOODY B500N GAMING MECHA-LIKE SWITCH NEON BACKLIGHT KEYBOARD U	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2355.00	t	f	f	a4tech-bloody-b500n-gaming-mecha-like-switch-neon-backlight-keyboard-u				f
592	A4TECH BLOODY B760 LIGHT STRIKE GAMING MECHANICAL NEON	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3285.00	t	f	f	a4tech-bloody-b760-light-strike-gaming-mechanical-neon				f
593	A4TECH KR-9276 (KR-92+OP-760) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1275.00	t	f	f	a4tech-kr-9276-kr-92op-760-keyboardmouse-set-usb-black-usrussian				f
594	Keyboard + Mouse Genius KM-160, Black, USB, RU, GO-170001	Оригинальный Genius — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1095.00	t	f	f	keyboard-mouse-genius-km-160-black-usb-ru-go-170001				f
595	Keyboard A4tech K-100, Black, USB, мембранная, Water-proof	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	975.00	t	f	f	keyboard-a4tech-k-100-black-usb-membrannaya-water-proof				f
596	Keyboard A4TECH KR-85 COMFORT USB BLACK	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	870.00	t	f	f	keyboard-a4tech-kr-85-comfort-usb-black				f
597	Keyboard Aeromax KB-509 BLACK RUS USB	Оригинальный Aeromax — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	595.00	t	f	f	keyboard-aeromax-kb-509-black-rus-usb				f
598	Keyboard Delux K6850U +М362BU keyboard+mouse black USB RUS+KG	Оригинальный DELUX — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	770.00	t	f	f	keyboard-delux-k6850u-m362bu-keyboardmouse-black-usb-ruskg				f
599	Keyboard Winstar Razeak RK-8778 GAMING COLOR LED RUS USB	Оригинальный Winstar — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	620.00	t	f	f	keyboard-winstar-razeak-rk-8778-gaming-color-led-rus-usb				f
600	WIRELESS Keyboard A4Tec 4200N (GK-92+G3-220N) KEYBOARD+MOUSE SET USB B	WIRELESS Keyboard A4Tec 4200N (GK-92+G3-220N) KEYBOARD+MOUSE SET USB B — клавиатура. Гарантия до 2 лет, доставка по Караколу.	1640.00	t	f	f	wireless-keyboard-a4tec-4200n-gk-92g3-220n-keyboardmouse-set-usb-b				f
601	Беспроводной комплект A4TECH 9300F (GR-152+G9-730FX) V-TRACK	Оригинальный A4TECH — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1990.00	t	f	f	besprovodnoy-komplekt-a4tech-9300f-gr-152g9-730fx-v-track				f
602	Клавиатура + мышь Genius Smart KM-200 USB черный	Оригинальный Genius — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1180.00	t	f	f	klaviatura-mysh-genius-smart-km-200-usb-chernyy				f
603	Клавиатура +мышь + коврик SVEN GS- 9200 игровая черно-красная	Оригинальный SVEN — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1535.00	t	f	f	klaviatura-mysh-kovrik-sven-gs-9200-igrovaya-cherno-krasnaya				f
604	Клавиатура Delux DLK-150GB, Ультратонкая, Беспроводная 2.4ГГц	Оригинальный DELUX — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1305.00	t	f	f	klaviatura-delux-dlk-150gb-ultratonkaya-besprovodnaya-24ggts				f
605	Клавиатура, X-Game,XK-100UB Ультратонкая, USB, Анг/Рус/Каз, Чёрный	Оригинальный X-Game — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	680.00	t	f	f	klaviatura-x-gamexk-100ub-ultratonkaya-usb-angruskaz-chyornyy				f
606	Клавиатура, X-Game,XK-200UB Ультратонкая, USB, Анг/Рус/Каз, Чёрный	Оригинальный X-Game — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	805.00	t	f	f	klaviatura-x-gamexk-200ub-ultratonkaya-usb-angruskaz-chyornyy				f
607	Клавиатура+мышь X-Game,XD-1100UB, USB, Анг/Рус/Каз,1,6м	Оригинальный X-Game — клавиатура. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1010.00	t	f	f	klaviaturamysh-x-gamexd-1100ub-usb-angruskaz16m				f
608	Asus Prime H310M-R, LGA1151, Intel H310, 2xDDR4, HDMI	Оригинальный ASUS — материнская плата. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3600.00	t	f	f	asus-prime-h310m-r-lga1151-intel-h310-2xddr4-hdmi				f
609	Gigabyte H610M H V2 DDR5, LGA1700, Intel H610, 2xDDR5 PC25600, 1xPCI-E	Оригинальный Gigabyte — материнская плата. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	7880.00	t	f	f	gigabyte-h610m-h-v2-ddr5-lga1700-intel-h610-2xddr5-pc25600-1xpci-e				f
610	Gigabyte H610M K\\Н DDR4, LGA1700, Intel H610, 2xDDR4 PC25600,	Оригинальный Gigabyte — материнская плата. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	6380.00	t	f	f	gigabyte-h610m-kn-ddr4-lga1700-intel-h610-2xddr4-pc25600				f
611	Gigabyte H610M Н DDR4, LGA1700, Intel H610, 2xDDR4 PC25600, 1xPCI-E16X	Оригинальный Gigabyte — материнская плата. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	6415.00	t	f	f	gigabyte-h610m-n-ddr4-lga1700-intel-h610-2xddr4-pc25600-1xpci-e16x				f
612	MB LGA1200 Gigabyte H410M H,2xDDR4,10xUSB,6xSATAIII	Оригинальный Gigabyte — материнская плата. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	5665.00	t	f	f	mb-lga1200-gigabyte-h410m-h2xddr410xusb6xsataiii				f
613	MB LGA1200 Gigabyte H510M S2H V2,2xDDR4,12xUSB,4xSATA3,mATX,M.2	Оригинальный Gigabyte — материнская плата. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	6030.00	t	f	f	mb-lga1200-gigabyte-h510m-s2h-v22xddr412xusb4xsata3matxm2				f
614	Матплата MAXSUN MS-Challenger H810M-F, LGA1851, Intel H810, 2xDDR5	Оригинальный Intel — материнская плата. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	9260.00	t	f	f	matplata-maxsun-ms-challenger-h810m-f-lga1851-intel-h810-2xddr5				f
615	DDR3 4096MB РС3-12800 Hikvision\\Zeppelin	DDR3 4096MB РС3-12800 Hikvision\\Zeppelin — оперативная память. Гарантия до 2 лет, доставка по Караколу.	1010.00	t	f	f	ddr3-4096mb-rs3-12800-hikvisionzeppelin				f
616	DDR4 16GB PC-21333 (2666Mhz) HIKVISION	Оригинальный HIKVISION — оперативная память. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	7600.00	t	f	f	ddr4-16gb-pc-21333-2666mhz-hikvision				f
617	DDR4 16GB PC-21333 TWINMOS	Оригинальный TWINMOS — оперативная память. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	10005.00	t	f	f	ddr4-16gb-pc-21333-twinmos				f
618	DDR4 16GB PC-25600 (3200Mhz) HIKVISION	Оригинальный HIKVISION — оперативная память. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	9700.00	t	f	f	ddr4-16gb-pc-25600-3200mhz-hikvision				f
619	DDR4 8GB PC-21333 - Hikvision\\Crusial/Zeppelin	DDR4 8GB PC-21333 - Hikvision\\Crusial/Zeppelin — оперативная память. Гарантия до 2 лет, доставка по Караколу.	5990.00	t	f	f	ddr4-8gb-pc-21333-hikvisioncrusialzeppelin				f
620	DDR4 8GB PC-21333 - Hikvision\\Dahua	DDR4 8GB PC-21333 - Hikvision\\Dahua — оперативная память. Гарантия до 2 лет, доставка по Караколу.	4270.00	t	f	f	ddr4-8gb-pc-21333-hikvisiondahua				f
621	TP-Link TD-W8961N 300Mbps Wireless N ADSL2+ Modem Router, Trendchip+R	Оригинальный TP-Link — сетевой модем. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2220.00	t	f	f	tp-link-td-w8961n-300mbps-wireless-n-adsl2-modem-router-trendchipr				f
622	ACER 27" XZ270 CURVED VA 180Hrz \\1920x1080 FHD Speakers 2x2W	Оригинальный Acer — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	17150.00	t	f	f	acer-27-xz270-curved-va-180hrz-1920x1080-fhd-speakers-2x2w				f
623	LCD 32"Samsung LS32FG512EIXCI, Odyssey G5, Black, VA, 2560x1440, 180Hz	LCD 32"Samsung LS32FG512EIXCI, Odyssey G5, Black, VA, 2560x1440, 180Hz — монитор. Гарантия до 2 лет, доставка по Караколу.	27060.00	t	f	f	lcd-32samsung-ls32fg512eixci-odyssey-g5-black-va-2560x1440-180hz				f
624	PHILIPS 27" 27E2N1100L VA LED WIDE 1920x1080 100HZ	Оригинальный Philips — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	9435.00	t	f	f	philips-27-27e2n1100l-va-led-wide-1920x1080-100hz				f
625	PHILIPS 27" 27M2N3200NF EVNIA GAMING IPS 1920x1080 144HZ 178/178 1500:	Оригинальный Philips — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	10855.00	t	f	f	philips-27-27m2n3200nf-evnia-gaming-ips-1920x1080-144hz-178178-1500				f
626	PHILIPS 27" 27M2N3200S EVNIA GAMING IPS 1920x1080 180HZ 178/178 1000:1	Оригинальный Philips — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	13365.00	t	f	f	philips-27-27m2n3200s-evnia-gaming-ips-1920x1080-180hz-178178-10001				f
627	PHILIPS 27" 27M2N3500N EVNIA GAMING VA 2560 x 1440 180HZ 178/178 10000	Оригинальный Philips — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	15655.00	t	f	f	philips-27-27m2n3500n-evnia-gaming-va-2560-x-1440-180hz-178178-10000				f
628	UNIVIEW 24" MW-LC24 LED VA FHD 16:9/100Hz/14ms/3000:1/178/178/250cd	Оригинальный UNIVIEW — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	6790.00	t	f	f	uniview-24-mw-lc24-led-va-fhd-169100hz14ms30001178178250cd				f
629	UNIVIEW 27" MW-LC27S IPS LED FHD 1920,1080 VGA HDMI	Оригинальный UNIVIEW — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	8465.00	t	f	f	uniview-27-mw-lc27s-ips-led-fhd-19201080-vga-hdmi				f
630	Монитор LCD 27" AOC C27G4ZXE, Curved, 280Hz	Оригинальный AOC — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	16320.00	t	f	f	monitor-lcd-27-aoc-c27g4zxe-curved-280hz				f
631	Монитор LCD 27" AOC Q27G4XF, FAST IPS, Black, 2560x1440\\180Hz порт реж	Оригинальный AOC — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	15870.00	t	f	f	monitor-lcd-27-aoc-q27g4xf-fast-ips-black-2560x1440180hz-port-rezh				f
632	Монитор LCD 27" Xiaomi Redmi G27Q 240Hz, IPS, 2560x1440, 240Hz,	Оригинальный Xiaomi — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	17240.00	t	f	f	monitor-lcd-27-xiaomi-redmi-g27q-240hz-ips-2560x1440-240hz				f
633	Монитор LCD 29" LG 29WQ600-W IPS, 2560x1080, 100Hz	Оригинальный LG — монитор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	22790.00	t	f	f	monitor-lcd-29-lg-29wq600-w-ips-2560x1080-100hz				f
634	A4TECH N-310 V-TRACK NOTEBOOK MOUSE USB BLACK/ORANGE	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	720.00	t	f	f	a4tech-n-310-v-track-notebook-mouse-usb-blackorange				f
635	A4TECH OP-330 OPTICAL MOUSE USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	400.00	t	f	f	a4tech-op-330-optical-mouse-usb-black				f
636	A4TECH OP-550 OPTICAL MOUSE USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	450.00	t	f	f	a4tech-op-550-optical-mouse-usb-black				f
637	A4TECH OP-620 OPTICAL MOUSE USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	480.00	t	f	f	a4tech-op-620-optical-mouse-usb-black				f
638	A4TECH OP-720 OPTICAL MOUSE USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	435.00	t	f	f	a4tech-op-720-optical-mouse-usb-black				f
639	A4TECH OP-760 OPTICAL MOUSE USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	470.00	t	f	f	a4tech-op-760-optical-mouse-usb-black				f
640	A4TECH BLOODY ES5 ESPORTS RGB MOUSE BLACK 6000CPI USB	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1250.00	t	f	f	a4tech-bloody-es5-esports-rgb-mouse-black-6000cpi-usb				f
641	A4TECH BLOODY ES8 ESPORTS RGB MOUSE SPORTS BLACK 6000CPI USB	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1225.00	t	f	f	a4tech-bloody-es8-esports-rgb-mouse-sports-black-6000cpi-usb				f
642	A4TECH BLOODY Q5081S BLOODY NEON X'GLIDE GAMING MOUSE Q50 + PAD USB B	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1730.00	t	f	f	a4tech-bloody-q5081s-bloody-neon-xglide-gaming-mouse-q50-pad-usb-b				f
643	A4TECH BLOODY Q81 NEON X'GLIDE GAMING MOUSE USB CURVE	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1385.00	t	f	f	a4tech-bloody-q81-neon-xglide-gaming-mouse-usb-curve				f
644	A4TECH BLOODY Q8181S BLOODY NEON X'GLIDE GAMING MOUSE Q81 + PAD USB B	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1770.00	t	f	f	a4tech-bloody-q8181s-bloody-neon-xglide-gaming-mouse-q81-pad-usb-b				f
645	A4Tech Bloody V7M, Игровая, Оптическая 3200dpii, 8 кнопок, Проводная,	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1590.00	t	f	f	a4tech-bloody-v7m-igrovaya-opticheskaya-3200dpii-8-knopok-provodnaya				f
646	A4TECH FSTYLER FG10 OPTICAL MOUSE WIRELESS 1200DPI BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	825.00	t	f	f	a4tech-fstyler-fg10-optical-mouse-wireless-1200dpi-black				f
647	A4TECH FSTYLER FG16 OPTICAL MOUSE WIRELESS 1200DPI BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	770.00	t	f	f	a4tech-fstyler-fg16-optical-mouse-wireless-1200dpi-black				f
648	A4TECH FSTYLER FG20 OPTICAL MOUSE WIRELESS 2000DPI BLACK/GREY	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	840.00	t	f	f	a4tech-fstyler-fg20-optical-mouse-wireless-2000dpi-blackgrey				f
649	A4TECH FSTYLER FG30 OPTICAL MOUSE WIRELESS 2000DPI BLACK/GREY	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	895.00	t	f	f	a4tech-fstyler-fg30-optical-mouse-wireless-2000dpi-blackgrey				f
650	A4TECH FSTYLER FG35 OPTICAL MOUSE WIRELESS 2000DPI розовая	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	875.00	t	f	f	a4tech-fstyler-fg35-optical-mouse-wireless-2000dpi-rozovaya				f
651	A4TECH FSTYLER FG50\\55+ OPTICAL MOUSE WIRELESS 2000DPI	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	905.00	t	f	f	a4tech-fstyler-fg5055-optical-mouse-wireless-2000dpi				f
652	A4TECH N-708Х V-TRACK MOUSE USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	685.00	t	f	f	a4tech-n-708h-v-track-mouse-usb-black				f
653	A4TECH N-810FX V-TRACK MOUSE USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	550.00	t	f	f	a4tech-n-810fx-v-track-mouse-usb-black				f
654	A4TECH X77 OSCAR NEON MAZE 2400 DPI GAME MOUSE USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1315.00	t	f	f	a4tech-x77-oscar-neon-maze-2400-dpi-game-mouse-usb-black				f
655	A4TECH X89 OSCAR NEON STONE 2400 DPI GAME MOUSE USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1185.00	t	f	f	a4tech-x89-oscar-neon-stone-2400-dpi-game-mouse-usb-black				f
656	Delux M138BU Optical black color,USB cable, 1000 DPI	Оригинальный DELUX — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	380.00	t	f	f	delux-m138bu-optical-black-colorusb-cable-1000-dpi				f
657	Delux M139BU Optical black color,USB cable, 1000 DPI	Оригинальный DELUX — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	390.00	t	f	f	delux-m139bu-optical-black-colorusb-cable-1000-dpi				f
658	Delux M321BU Optical black color,USB cable, 1000 DPI	Оригинальный DELUX — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	390.00	t	f	f	delux-m321bu-optical-black-colorusb-cable-1000-dpi				f
659	Mouse A4Tech G3-280N V-Track, Black, 1000 dpi, USB, padless wireless	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	755.00	t	f	f	mouse-a4tech-g3-280n-v-track-black-1000-dpi-usb-padless-wireless				f
660	Mouse A4Tech G3-300N V-Track, Black, 1000 dpi, USB, padless wireless	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	735.00	t	f	f	mouse-a4tech-g3-300n-v-track-black-1000-dpi-usb-padless-wireless				f
661	Mouse A4TECH G7-350N V-TRACK PADLESS WIRELESS MOUSE USB TITAN GRAY	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1400.00	t	f	f	mouse-a4tech-g7-350n-v-track-padless-wireless-mouse-usb-titan-gray				f
662	Mouse A4TECH G9-110F V-TRACK MOUSE WIRELESS USB BLACK	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1315.00	t	f	f	mouse-a4tech-g9-110f-v-track-mouse-wireless-usb-black				f
663	Mouse Defender Doom Fighter GM-260L 800-3200dpi игровая+ коврик	Оригинальный Defender — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	905.00	t	f	f	mouse-defender-doom-fighter-gm-260l-800-3200dpi-igrovaya-kovrik				f
664	Mouse Defender Monstro GM-510L оптика,6кнопок,3200dpi игровая	Оригинальный Defender — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	975.00	t	f	f	mouse-defender-monstro-gm-510l-optika6knopok3200dpi-igrovaya				f
665	Mouse Defender Shock GM-110L оптика,6кнопок,800-3200 игровая +коврик	Оригинальный Defender — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	845.00	t	f	f	mouse-defender-shock-gm-110l-optika6knopok800-3200-igrovaya-kovrik				f
666	Mouse Defender Skull GM-180L оптика,6кнопок,800-3200dpi игровая	Оригинальный Defender — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	895.00	t	f	f	mouse-defender-skull-gm-180l-optika6knopok800-3200dpi-igrovaya				f
667	Mouse Genius DX-125 USB Optical	Оригинальный Genius — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	510.00	t	f	f	mouse-genius-dx-125-usb-optical				f
668	Mouse Genius DX-150Х USB Optical	Оригинальный Genius — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	535.00	t	f	f	mouse-genius-dx-150h-usb-optical				f
669	Mouse Genius NX-7005 USB Optical -Беспроводная	Оригинальный Genius — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	830.00	t	f	f	mouse-genius-nx-7005-usb-optical-besprovodnaya				f
670	Mouse Genius NX-7015 USB Optical -Беспроводная	Оригинальный Genius — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	985.00	t	f	f	mouse-genius-nx-7015-usb-optical-besprovodnaya				f
671	Mouse Winstar Razeak RM-015 Gaming	Оригинальный Winstar — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	380.00	t	f	f	mouse-winstar-razeak-rm-015-gaming				f
672	Mouse Winstar Razeak RM-142 Gaming RGB USB	Оригинальный Winstar — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	570.00	t	f	f	mouse-winstar-razeak-rm-142-gaming-rgb-usb				f
673	Mouse Winstar Razeak RM-X18 Gaming	Оригинальный Winstar — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	725.00	t	f	f	mouse-winstar-razeak-rm-x18-gaming				f
674	Mouse Winstar WS-MS-901 USB	Оригинальный Winstar — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	285.00	t	f	f	mouse-winstar-ws-ms-901-usb				f
675	Mouse Winstar WS-MS-930 USB	Оригинальный Winstar — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	285.00	t	f	f	mouse-winstar-ws-ms-930-usb				f
676	Mouse X-Game, XM-880OUB, 1000DPI, Оптический, USB, Черный	Оригинальный X-Game — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	305.00	t	f	f	mouse-x-game-xm-880oub-1000dpi-opticheskiy-usb-chernyy				f
677	Pad rubber с картинкой \\ microsoft	Pad rubber с картинкой \\ microsoft — компьютерная мышь или коврик. Гарантия до 2 лет, доставка по Караколу.	100.00	t	f	f	pad-rubber-s-kartinkoy-microsoft				f
678	Pad rubber с картинкой \\ microsoft - мини	Pad rubber с картинкой \\ microsoft - мини — компьютерная мышь или коврик. Гарантия до 2 лет, доставка по Караколу.	90.00	t	f	f	pad-rubber-s-kartinkoy-microsoft-mini				f
679	Pad rubber с картинкой \\ microsoft BIG 40х90	Pad rubber с картинкой \\ microsoft BIG 40х90 — компьютерная мышь или коврик. Гарантия до 2 лет, доставка по Караколу.	490.00	t	f	f	pad-rubber-s-kartinkoy-microsoft-big-40h90				f
680	Pad rubber с картинкой \\ microsoft обшитые	Pad rubber с картинкой \\ microsoft обшитые — компьютерная мышь или коврик. Гарантия до 2 лет, доставка по Караколу.	190.00	t	f	f	pad-rubber-s-kartinkoy-microsoft-obshitye				f
681	Коврик A4TECH BLOODY B-080S PROFESSIONAL X-THIN GAMING MOUSE PAD (430x	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	550.00	t	f	f	kovrik-a4tech-bloody-b-080s-professional-x-thin-gaming-mouse-pad-430x				f
682	Коврик A4TECH FSTYLER FP25 MOUSE PAD 250x200x2mm	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	320.00	t	f	f	kovrik-a4tech-fstyler-fp25-mouse-pad-250x200x2mm				f
683	Коврик для мышки A4Tech Bloody B-088S PROFESSIONAL X-THIN игровой	Оригинальный A4TECH — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	760.00	t	f	f	kovrik-dlya-myshki-a4tech-bloody-b-088s-professional-x-thin-igrovoy				f
684	Мышь RITMIX ROM-306 Black 1000 dpi; подсветка 7 цветов	Оригинальный RITMIX — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	520.00	t	f	f	mysh-ritmix-rom-306-black-1000-dpi-podsvetka-7-tsvetov				f
685	Мышь RITMIX ROM-307 Black 800-2400 dpi; USB 1.35м	Оригинальный RITMIX — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	565.00	t	f	f	mysh-ritmix-rom-307-black-800-2400-dpi-usb-135m				f
686	Мышь RITMIX ROM-311 Black 800-2400 dpi; подсветка 7 цветов	Оригинальный RITMIX — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	570.00	t	f	f	mysh-ritmix-rom-311-black-800-2400-dpi-podsvetka-7-tsvetov				f
687	Мышь SVEN RX-112 USB черная	Оригинальный SVEN — компьютерная мышь или коврик. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	480.00	t	f	f	mysh-sven-rx-112-usb-chernaya				f
688	Web Cam A4Tech PK-925H 1080p FHD USB 2MP(16MP)	Оригинальный A4TECH — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1970.00	t	f	f	web-cam-a4tech-pk-925h-1080p-fhd-usb-2mp16mp				f
689	Web Cam HIKVISION DS-U02 1080P FHD USB + Mic BLACK	Оригинальный HIKVISION — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1840.00	t	f	f	web-cam-hikvision-ds-u02-1080p-fhd-usb-mic-black				f
690	Микрофон SVEN MK-390	Оригинальный SVEN — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	560.00	t	f	f	mikrofon-sven-mk-390				f
691	Микрофон SVEN MK-490	Оригинальный SVEN — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	690.00	t	f	f	mikrofon-sven-mk-490				f
692	Наушники "SOMiC" G926 игровые	Наушники "SOMiC" G926 игровые — мультимедийное устройство. Гарантия до 2 лет, доставка по Караколу.	1830.00	t	f	f	naushniki-somic-g926-igrovye				f
693	Наушники Genius HS-G560 2xJack, 20Hz-20kHz, 113dB/-54dB, черные	Оригинальный Genius — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1690.00	t	f	f	naushniki-genius-hs-g560-2xjack-20hz-20khz-113db-54db-chernye				f
694	Наушники SVEN AP-680MV с микрофоном, черно-синие	Оригинальный SVEN — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1150.00	t	f	f	naushniki-sven-ap-680mv-s-mikrofonom-cherno-sinie				f
695	Наушники SVEN AP-G855MV Gaming, черный-красные	Оригинальный SVEN — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1600.00	t	f	f	naushniki-sven-ap-g855mv-gaming-chernyy-krasnye				f
696	Наушники SVEN AP-U910MV с микрофоном USB stereo	Оригинальный SVEN — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2315.00	t	f	f	naushniki-sven-ap-u910mv-s-mikrofonom-usb-stereo				f
697	Наушники беспроводные Microlab Outlander 300I черный	Оригинальный Microlab — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2175.00	t	f	f	naushniki-besprovodnye-microlab-outlander-300i-chernyy				f
698	Наушники с микрофоном A4Tech BLOODY G220 NEON Gaming 3.5mm & USB Blac	Оригинальный A4TECH — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1465.00	t	f	f	naushniki-s-mikrofonom-a4tech-bloody-g220-neon-gaming-35mm-usb-blac				f
699	Наушники с микрофоном A4Tech BLOODY G230P RGB Gaming 3.5mm Black	Оригинальный A4TECH — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1470.00	t	f	f	naushniki-s-mikrofonom-a4tech-bloody-g230p-rgb-gaming-35mm-black				f
700	Наушники с микрофоном A4Tech BLOODY G570 RGB Gaming	Оригинальный A4TECH — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2290.00	t	f	f	naushniki-s-mikrofonom-a4tech-bloody-g570-rgb-gaming				f
701	Наушники с микрофоном A4Tech FSTYLER FH300U NEON USB BLACK	Оригинальный A4TECH — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1310.00	t	f	f	naushniki-s-mikrofonom-a4tech-fstyler-fh300u-neon-usb-black				f
702	Наушники с микрофоном A4TECH HS-105	Оригинальный A4TECH — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	755.00	t	f	f	naushniki-s-mikrofonom-a4tech-hs-105				f
703	Наушники с микрофоном A4Tech HU-9,20Hz-20KGhz,32ohm,100dB,180cm,USB	Оригинальный A4TECH — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1105.00	t	f	f	naushniki-s-mikrofonom-a4tech-hu-920hz-20kghz32ohm100db180cmusb				f
704	Наушники с микрофоном Edifier W800BT SE Bluetooth 5.4	Оригинальный Edifier — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2790.00	t	f	f	naushniki-s-mikrofonom-edifier-w800bt-se-bluetooth-54				f
705	Наушники с микрофоном Genius HS-G560 2xJack, 20Hz-20kHz, 91dB/-54dB, Ч	Оригинальный Genius — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1495.00	t	f	f	naushniki-s-mikrofonom-genius-hs-g560-2xjack-20hz-20khz-91db-54db-ch				f
706	Наушники с микрофоном Genius HS-G600V, Дуговые, 2 x mini jack 3.5 mm,	Оригинальный Genius — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2040.00	t	f	f	naushniki-s-mikrofonom-genius-hs-g600v-dugovye-2-x-mini-jack-35-mm				f
707	Наушники с микрофоном Genius HS-G710V, Дуговые, USB, 20Hz-20kHz, 110dB	Оригинальный Genius — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2790.00	t	f	f	naushniki-s-mikrofonom-genius-hs-g710v-dugovye-usb-20hz-20khz-110db				f
708	Наушники с микрофоном Genius HS-M200C , Дуговые	Оригинальный Genius — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	600.00	t	f	f	naushniki-s-mikrofonom-genius-hs-m200c-dugovye				f
709	Наушники с микрофоном Microlab G4 GAMING BLACK/BLUE	Оригинальный Microlab — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2165.00	t	f	f	naushniki-s-mikrofonom-microlab-g4-gaming-blackblue				f
710	Наушники с микрофоном Microlab G6 GAMING BLACK/RED	Оригинальный Microlab — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1500.00	t	f	f	naushniki-s-mikrofonom-microlab-g6-gaming-blackred				f
711	Подставка для наушников A4TECH BLOODY GS2L USB RGB, 150cm cable	Оригинальный A4TECH — мультимедийное устройство. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1405.00	t	f	f	podstavka-dlya-naushnikov-a4tech-bloody-gs2l-usb-rgb-150cm-cable				f
712	Cable UTP-5 DAHUA для внешних работ	Оригинальный Dahua — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	45.00	t	f	f	cable-utp-5-dahua-dlya-vneshnih-rabot				f
713	Cable UTP-5 DAHUA для внутренних работ	Оригинальный Dahua — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	40.00	t	f	f	cable-utp-5-dahua-dlya-vnutrennih-rabot				f
714	Cable UTP-5 Hikvision для внешних работ	Оригинальный HIKVISION — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	45.00	t	f	f	cable-utp-5-hikvision-dlya-vneshnih-rabot				f
715	Cable UTP-5 Андижан для внутренних работ	Cable UTP-5 Андижан для внутренних работ — сетевое оборудование. Гарантия до 2 лет, доставка по Караколу.	40.00	t	f	f	cable-utp-5-andizhan-dlya-vnutrennih-rabot				f
716	Connector SHIP S901A (RG-45 - UTP-5 10\\100\\1000)	Connector SHIP S901A (RG-45 - UTP-5 10\\100\\1000) — сетевое оборудование. Гарантия до 2 лет, доставка по Караколу.	15.00	t	f	f	connector-ship-s901a-rg-45-utp-5-101001000				f
717	Ethernet Adapter TP-Link 3468 10/100/1000 Mbps, PCE Ex	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1250.00	t	f	f	ethernet-adapter-tp-link-3468-101001000-mbps-pce-ex				f
718	HUB HIKVISION 5-port 10/100	Оригинальный HIKVISION — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	825.00	t	f	f	hub-hikvision-5-port-10100				f
719	HUB HIKVISION 5-port 10/100/1000	Оригинальный HIKVISION — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1055.00	t	f	f	hub-hikvision-5-port-101001000				f
720	HUB HIKVISION 8-port 10/100	Оригинальный HIKVISION — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	880.00	t	f	f	hub-hikvision-8-port-10100				f
721	HUB HIKVISION 8-port 10/100/1000	Оригинальный HIKVISION — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1500.00	t	f	f	hub-hikvision-8-port-101001000				f
722	HUB Switch Tenda 5-port 10/100\\1000	Оригинальный Tenda — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	920.00	t	f	f	hub-switch-tenda-5-port-101001000				f
723	HUB Switch TP-Link 5-port 10/100	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	955.00	t	f	f	hub-switch-tp-link-5-port-10100				f
724	HUB Switch TP-Link 5-port 10/100\\1000 бит	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1335.00	t	f	f	hub-switch-tp-link-5-port-101001000-bit				f
725	HUB Switch TP-Link 8-port 10/100	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1040.00	t	f	f	hub-switch-tp-link-8-port-10100				f
726	HUB Switch TP-Link 8-port 10/100/1000	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2190.00	t	f	f	hub-switch-tp-link-8-port-101001000				f
727	Wi-Fi AP+Router TP-Link Archer C20 AC750 Wireless Dual Band Router	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2650.00	t	f	f	wi-fi-aprouter-tp-link-archer-c20-ac750-wireless-dual-band-router				f
728	Wi-Fi CUDY WU300 AX300 286Mbps Wi-Fi USB Adapter, Mini Size,286Mbps at	Оригинальный CUDY — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	960.00	t	f	f	wi-fi-cudy-wu300-ax300-286mbps-wi-fi-usb-adapter-mini-size286mbps-at				f
729	Wi-Fi Router TP-LINK Archer AX23 AX1800 Dual-Band Wi-Fi 6	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	5440.00	t	f	f	wi-fi-router-tp-link-archer-ax23-ax1800-dual-band-wi-fi-6				f
730	Wi-Fi Router TP-LINK Archer C86 AC1900 Dual-Band, 1300Mbps at 5GHz + 6	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4980.00	t	f	f	wi-fi-router-tp-link-archer-c86-ac1900-dual-band-1300mbps-at-5ghz-6				f
731	Wireless Adapter TP-Link TL-WN781ND N150 Mb/s, 2.4Ghz1антена PCE Ex	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1040.00	t	f	f	wireless-adapter-tp-link-tl-wn781nd-n150-mbs-24ghz1antena-pce-ex				f
732	Wireless LAN Adapter TP-Link TL-WN725N Wi-Fi 150Мб USB	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	755.00	t	f	f	wireless-lan-adapter-tp-link-tl-wn725n-wi-fi-150mb-usb				f
733	Wireless LAN Adapter TP-Link TL-WN751ND Wi-Fi 150Mb PCI	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	950.00	t	f	f	wireless-lan-adapter-tp-link-tl-wn751nd-wi-fi-150mb-pci				f
734	Wireless Router MikroTik hAP Aх2	Оригинальный MikroTik — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	10400.00	t	f	f	wireless-router-mikrotik-hap-ah2				f
735	Wireless Router MikroTik hAP Lite	Оригинальный MikroTik — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3500.00	t	f	f	wireless-router-mikrotik-hap-lite				f
736	Wireless Router TP-LINK Archer C54(RU) AC1200 Dual-Band Wi-Fi, 867Mb/s	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2760.00	t	f	f	wireless-router-tp-link-archer-c54ru-ac1200-dual-band-wi-fi-867mbs				f
737	Wireless Router TP-LINK TL-WR840N Wi-Fi 300 Мб, 4 LAN 100 Мб	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1610.00	t	f	f	wireless-router-tp-link-tl-wr840n-wi-fi-300-mb-4-lan-100-mb				f
738	Wireless Router TP-LINK TL-WR842N Wi-Fi 300 Мб, 4 LAN 100 Мб 3G\\4G	Оригинальный TP-Link — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1645.00	t	f	f	wireless-router-tp-link-tl-wr842n-wi-fi-300-mb-4-lan-100-mb-3g4g				f
739	Беспроводной маршрутизатор Wi-Fi CUDY WR1300 AC1200 Gigabit Mesh	Оригинальный CUDY — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3000.00	t	f	f	besprovodnoy-marshrutizator-wi-fi-cudy-wr1300-ac1200-gigabit-mesh				f
740	Беспроводной маршрутизатор Wi-Fi CUDY WR1500 AX1500 Gigabit 6 Dual-Ban	Оригинальный CUDY — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3000.00	t	f	f	besprovodnoy-marshrutizator-wi-fi-cudy-wr1500-ax1500-gigabit-6-dual-ban				f
741	Беспроводной маршрутизатор Wi-Fi CUDY WR3000P AX3000 Gigabit 6 Mesh 1.	Оригинальный CUDY — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4940.00	t	f	f	besprovodnoy-marshrutizator-wi-fi-cudy-wr3000p-ax3000-gigabit-6-mesh-1				f
742	Сетевой адаптер USB 2,0 /100Mb (RG45Lan)	Сетевой адаптер USB 2,0 /100Mb (RG45Lan) — сетевое оборудование. Гарантия до 2 лет, доставка по Караколу.	700.00	t	f	f	setevoy-adapter-usb-20-100mb-rg45lan				f
743	Сетевой двойник	Сетевой двойник — сетевое оборудование. Гарантия до 2 лет, доставка по Караколу.	100.00	t	f	f	setevoy-dvoynik				f
744	Сплиттер сетевой RJ45 UGREEN CM 210	Оригинальный UGREEN — сетевое оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	310.00	t	f	f	splitter-setevoy-rj45-ugreen-cm-210				f
745	Щипцы обжимный RJ-45 ,RJ-11 HSD 568R	Щипцы обжимный RJ-45 ,RJ-11 HSD 568R — сетевое оборудование. Гарантия до 2 лет, доставка по Караколу.	645.00	t	f	f	schiptsy-obzhimnyy-rj-45-rj-11-hsd-568r				f
746	Acer Aspire AL15-32P Lite N4500 8GB, 256GB SSD M.2 NVMe PCIe	Оригинальный Acer — ноутбук. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	34540.00	t	f	f	acer-aspire-al15-32p-lite-n4500-8gb-256gb-ssd-m2-nvme-pcie				f
747	Acer Aspire Lite Ryzen 5 7430U 2.3-4.3GHz,16GB,SSD 512GB,RX VEGA 7, 15	Оригинальный Acer — ноутбук. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	49485.00	t	f	f	acer-aspire-lite-ryzen-5-7430u-23-43ghz16gbssd-512gbrx-vega-7-15				f
748	Acer NITRO V ANV15-52-74Y5 i7-13620H\\32GB DDR4\\ 1TB SSD m2 NVMe, 15.6"	Оригинальный Acer — ноутбук. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	115880.00	t	f	f	acer-nitro-v-anv15-52-74y5-i7-13620h32gb-ddr4-1tb-ssd-m2-nvme-156				f
749	HP 15 AMD Ryzen 3 7320U,15.6" LED FULL HD, 8GB LPDDR5-5500MHz, 256GB S	Оригинальный HP — ноутбук. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	37535.00	t	f	f	hp-15-amd-ryzen-3-7320u156-led-full-hd-8gb-lpddr5-5500mhz-256gb-s				f
750	HP 15-fc0171nia Athlon Silver 7120U 2.4-3.5GHz,8GB,SSD 256GB,15.6" FHD	Оригинальный HP — ноутбук. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	31895.00	t	f	f	hp-15-fc0171nia-athlon-silver-7120u-24-35ghz8gbssd-256gb156-fhd				f
751	Hp 15-fd0230wm Intel Core i3-N305, 16GB DDR4-3200Mhz, 512GB SSD, 15.6"	Оригинальный HP — ноутбук. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	46025.00	t	f	f	hp-15-fd0230wm-intel-core-i3-n305-16gb-ddr4-3200mhz-512gb-ssd-156				f
752	Lenovo V15 G2 IJL Intel N4500, 8GB, 512GB M.2, 15.6" FULL HD (1920x108	Оригинальный Lenovo — ноутбук. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	32335.00	t	f	f	lenovo-v15-g2-ijl-intel-n4500-8gb-512gb-m2-156-full-hd-1920x108				f
753	Lenovo V15 G4 i3-1315U 1.2-4.5GHz,8GB,SSD 256GB,15.6"FHD RUS BLACK	Оригинальный Lenovo — ноутбук. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	40615.00	t	f	f	lenovo-v15-g4-i3-1315u-12-45ghz8gbssd-256gb156fhd-rus-black				f
754	Power Supply Aerocool VX-400 PLUS, 400W, ATX, Passive-PFC, 20+4 pin, 4	Оригинальный Aerocool — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2340.00	t	f	f	power-supply-aerocool-vx-400-plus-400w-atx-passive-pfc-204-pin-4				f
755	Power Unit DELUX DLP-23D 280W(330A)20+4PIN,2*SATA,3*big 4pin,1*small 4	Оригинальный DELUX — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1545.00	t	f	f	power-unit-delux-dlp-23d-280w330a204pin2sata3big-4pin1small-4				f
756	Power Unit DELUX DLP-30D 420W(360A)20+4PIN,2*SATA,3*big 4pin,1*small 4	Оригинальный DELUX — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2205.00	t	f	f	power-unit-delux-dlp-30d-420w360a204pin2sata3big-4pin1small-4				f
757	Power Unit DELUX DLP-35D 480W(360A)20+4PIN,2*SATA,3*big 4pin,1*small 4	Оригинальный DELUX — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2425.00	t	f	f	power-unit-delux-dlp-35d-480w360a204pin2sata3big-4pin1small-4				f
758	Power Unit WINSTAR ATX-700 700W 80 PLUS Bronze	Оригинальный Winstar — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3525.00	t	f	f	power-unit-winstar-atx-700-700w-80-plus-bronze				f
759	PSU Jump ATX 520-P4 (total 500W) 24PIN+4P+1FDD+3SATA+2ATA, Shield	Оригинальный Jump — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2730.00	t	f	f	psu-jump-atx-520-p4-total-500w-24pin4p1fdd3sata2ata-shield				f
760	PSU Jump ATX 650-P4 (total 650W) 80+ Bronze certifed	Оригинальный Jump — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3815.00	t	f	f	psu-jump-atx-650-p4-total-650w-80-bronze-certifed				f
761	PSU Jump ATX 800-P4 (total 800W) 80+ Bronze	Оригинальный Jump — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4270.00	t	f	f	psu-jump-atx-800-p4-total-800w-80-bronze				f
762	PSU Jump DR- 450 (total 450-500W) 24PIN+4P+1FDD+3SATA+2ATA,	Оригинальный Jump — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1940.00	t	f	f	psu-jump-dr-450-total-450-500w-24pin4p1fdd3sata2ata				f
763	PSU Jump DR-420R (total 400W) 24PIN+4P+1FDD+3SATA+2ATA, Shield	Оригинальный Jump — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1745.00	t	f	f	psu-jump-dr-420r-total-400w-24pin4p1fdd3sata2ata-shield				f
764	Блок питания Jump DR-380R, 350WATX, 20+4 pin, 4+4pin, 3*Sata, 1*Molex	Оригинальный Jump — блок питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1355.00	t	f	f	blok-pitaniya-jump-dr-380r-350watx-204-pin-44pin-3sata-1molex				f
765	Canon LaserBase i-SENSYS MF3010 (картридж 725 + USB)	Оригинальный Canon — принтер или МФУ. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	25120.00	t	f	f	canon-laserbase-i-sensys-mf3010-kartridzh-725-usb				f
766	МФУ струйное Epson L3250 with Wi-Fi A4, printer, scanner, copier	Оригинальный Epson — принтер или МФУ. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	21215.00	t	f	f	mfu-struynoe-epson-l3250-with-wi-fi-a4-printer-scanner-copier				f
767	CPU LGA1200 Intel Core i3-10105 3.6-4.4GHz,6MB Cache L3,EMT64,4 Cores	Оригинальный Intel — процессор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	10355.00	t	f	f	cpu-lga1200-intel-core-i3-10105-36-44ghz6mb-cache-l3emt644-cores				f
768	CPU LGA1700 Intel Core i3-12100 3.3-4.3GHz,12MB Cache L3,EMT64,4 Cores	Оригинальный Intel — процессор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	13740.00	t	f	f	cpu-lga1700-intel-core-i3-12100-33-43ghz12mb-cache-l3emt644-cores				f
769	CPU LGA1700 Intel Core i3-14100 3.5-4.7GHz,12MB Cache L3,EMT64,4 Cores	Оригинальный Intel — процессор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	13960.00	t	f	f	cpu-lga1700-intel-core-i3-14100-35-47ghz12mb-cache-l3emt644-cores				f
770	CPU LGA1700 Intel Core i5-12400, LGA1700 2.50-4.40GHz, 6xCores	Оригинальный Intel — процессор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	18465.00	t	f	f	cpu-lga1700-intel-core-i5-12400-lga1700-250-440ghz-6xcores				f
771	CPU LGA1700 Intel Core i5-13400, LGA1700, 1.8-4.60GHz, 6xCores	Оригинальный Intel — процессор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	17100.00	t	f	f	cpu-lga1700-intel-core-i5-13400-lga1700-18-460ghz-6xcores				f
772	CPU LGA1700 Intel Core i5-14400, LGA1700, 1.8-4.70GHz, 6xCores	Оригинальный Intel — процессор. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	18590.00	t	f	f	cpu-lga1700-intel-core-i5-14400-lga1700-18-470ghz-6xcores				f
773	Microlab Speakers B-16 2.5W 2.0 USB	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	855.00	t	f	f	microlab-speakers-b-16-25w-20-usb				f
774	Microlab Subwoofer M-100 MKII 2.1 BLACK 10W (5W+2.5W*2	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2090.00	t	f	f	microlab-subwoofer-m-100-mkii-21-black-10w-5w25w2				f
775	Microlab Subwoofer M-105R 2.1 10W (5W+2.5W*2) BLACK	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2370.00	t	f	f	microlab-subwoofer-m-105r-21-10w-5w25w2-black				f
776	Microlab Subwoofer M-108BT 2.1 11W (6W+2.5W*2) BLACK	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2390.00	t	f	f	microlab-subwoofer-m-108bt-21-11w-6w25w2-black				f
777	Microlab Subwoofer M-110 2.1 10W (5W+2.5W*2) BLACK	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2650.00	t	f	f	microlab-subwoofer-m-110-21-10w-5w25w2-black				f
778	Microlab Subwoofer M-111 2.1 12W (5W+2.5W*2) BLACK	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2680.00	t	f	f	microlab-subwoofer-m-111-21-12w-5w25w2-black				f
779	Microlab Subwoofer M-210 2.1 11W (5W+3W*2) BLACK	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1645.00	t	f	f	microlab-subwoofer-m-210-21-11w-5w3w2-black				f
780	Microlab Subwoofer M-223II 2.1 17W (9W+4W*2) BLACK	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3090.00	t	f	f	microlab-subwoofer-m-223ii-21-17w-9w4w2-black				f
781	Microlab Subwoofer M-270 2.1 11W (5W+3W*2) USB\\BLACK	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1350.00	t	f	f	microlab-subwoofer-m-270-21-11w-5w3w2-usbblack				f
782	Microlab Subwoofer M-300U 2.1 BLACK 40W(20W+2*10W)	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	3595.00	t	f	f	microlab-subwoofer-m-300u-21-black-40w20w210w				f
783	Microlab Subwoofer M-500U/ 2.1 40W(16+2*12) USB/SD CARD BLACK	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4340.00	t	f	f	microlab-subwoofer-m-500u-21-40w16212-usbsd-card-black				f
784	Microlab Subwoofer U-220 RGB 2.1 BLACK 10W (2.5Wx2 + 5W) USB, Bluetoot	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1465.00	t	f	f	microlab-subwoofer-u-220-rgb-21-black-10w-25wx2-5w-usb-bluetoot				f
785	Microlab Subwoofer U-270 Phenix Gaming RGB 2.1 BLACK 11W (5W+3W*2) USB	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1350.00	t	f	f	microlab-subwoofer-u-270-phenix-gaming-rgb-21-black-11w-5w3w2-usb				f
786	Speakers Genius SP-Q160 Dark Grey, 6W (3W x 2), USB	Оригинальный Genius — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1010.00	t	f	f	speakers-genius-sp-q160-dark-grey-6w-3w-x-2-usb				f
787	Speakers Microlab B-15 6W 2.0 USB	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	785.00	t	f	f	speakers-microlab-b-15-6w-20-usb				f
788	Speakers Microlab B-22 6W 2.0 USB	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1200.00	t	f	f	speakers-microlab-b-22-6w-20-usb				f
789	Speakers Microlab B-23 6W 2.0 USB	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1135.00	t	f	f	speakers-microlab-b-23-6w-20-usb				f
790	Speakers Microlab B-26 4W 2.0 USB	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	960.00	t	f	f	speakers-microlab-b-26-4w-20-usb				f
791	Speakers Microlab B-55 (V2) 2.0 USB 1W BLACK	Оригинальный Microlab — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1005.00	t	f	f	speakers-microlab-b-55-v2-20-usb-1w-black				f
792	Speakers SVEN 255	Оригинальный SVEN — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1160.00	t	f	f	speakers-sven-255				f
793	Speakers SVEN 312 черный, RMS 4Вт, miniJack 3.5mm	Оригинальный SVEN — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1045.00	t	f	f	speakers-sven-312-chernyy-rms-4vt-minijack-35mm				f
794	Speakers SVEN 445	Оригинальный SVEN — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1975.00	t	f	f	speakers-sven-445				f
795	Speakers Фонтан	Speakers Фонтан — акустическая система. Гарантия до 2 лет, доставка по Караколу.	1480.00	t	f	f	speakers-fontan				f
796	Акустическая система 2.1 SVEN MS-304 черный, RMS 40Вт(20+2x10), SD сло	Оригинальный SVEN — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	5880.00	t	f	f	akusticheskaya-sistema-21-sven-ms-304-chernyy-rms-40vt202x10-sd-slo				f
797	Акустическая система 2.1 SVEN MS-80 черный	Оригинальный SVEN — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2010.00	t	f	f	akusticheskaya-sistema-21-sven-ms-80-chernyy				f
798	Беспроводная колонка Edifier MP85 , ,85dB(A), 5.0BT, 2.2W, Черный	Оригинальный Edifier — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1355.00	t	f	f	besprovodnaya-kolonka-edifier-mp85-85dba-50bt-22w-chernyy				f
799	Беспроводная колонка Edifier MP85 , 85dB(A), 5.0BT, 2.2W, Черный	Оригинальный Edifier — акустическая система. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1380.00	t	f	f	besprovodnaya-kolonka-edifier-mp85-85dba-50bt-22w-chernyy-2				f
800	UPS ANC 850VA (AVR), 2 Output Socket	Оригинальный ANC — источник бесперебойного питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4435.00	t	f	f	ups-anc-850va-avr-2-output-socket				f
801	UPS AWP AID850 850VA 162V-295V AVR 12V/8ah	Оригинальный AWP — источник бесперебойного питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4435.00	t	f	f	ups-awp-aid850-850va-162v-295v-avr-12v8ah				f
802	UPS SVC 600VA - L	Оригинальный SVC — источник бесперебойного питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	4755.00	t	f	f	ups-svc-600va-l				f
803	UPS SVC 650VA - L - LCD	Оригинальный SVC — источник бесперебойного питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	5940.00	t	f	f	ups-svc-650va-l-lcd				f
804	Инвертор SVC DIL-1200 (1000W), Вход 12В и/или 220В, Выход 220В, (Чиста	Оригинальный SVC — источник бесперебойного питания. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	15760.00	t	f	f	invertor-svc-dil-1200-1000w-vhod-12v-iili-220v-vyhod-220v-chista				f
805	RTX 3050 ASUS Dual GeForce RTX 3050 6GB GDDR6, 92Bit	Оригинальный ASUS — видеокарта. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	24630.00	t	f	f	rtx-3050-asus-dual-geforce-rtx-3050-6gb-gddr6-92bit				f
806	Видеокарта RTX 5050 ZOTAC GAMING GeForce RTX 5050 8GB GDDR6	Оригинальный ZOTAC — видеокарта. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	30100.00	t	f	f	videokarta-rtx-5050-zotac-gaming-geforce-rtx-5050-8gb-gddr6				f
807	Аккамулятор для UPS 12V \\ 7A Matrix\\Delta	Аккамулятор для UPS 12V \\ 7A Matrix\\Delta — аккумулятор для ИБП. Гарантия до 2 лет, доставка по Караколу.	1450.00	t	f	f	akkamulyator-dlya-ups-12v-7a-matrixdelta				f
808	Аккамулятор для UPS 12V \\ 9A Delta	Оригинальный Delta — аккумулятор для ИБП. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2040.00	t	f	f	akkamulyator-dlya-ups-12v-9a-delta				f
809	Антивирус Dr.Web Security Space 1пк \\ 1год	Оригинальный Dr.Web — кабель и переходник. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1240.00	t	f	f	antivirus-drweb-security-space-1pk-1god				f
810	Антивирус Dr.Web Security Space 1пк \\ 6 месяцев	Оригинальный Dr.Web — кабель и переходник. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	600.00	t	f	f	antivirus-drweb-security-space-1pk-6-mesyatsev				f
811	Антивирус Dr.Web Security Space 2пк \\ 1год	Оригинальный Dr.Web — кабель и переходник. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1770.00	t	f	f	antivirus-drweb-security-space-2pk-1god				f
812	Антивирус Dr.Web Security Space 2пк \\ 1год продление	Оригинальный Dr.Web — кабель и переходник. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1280.00	t	f	f	antivirus-drweb-security-space-2pk-1god-prodlenie				f
813	Антивирус Dr.Web Security Space 2 пк \\ 2 года	Оригинальный Dr.Web — кабель и переходник. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2350.00	t	f	f	antivirus-drweb-security-space-2-pk-2-goda				f
814	Антивирус Касперский	Оригинальный Касперский — кабель и переходник. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2230.00	t	f	f	antivirus-kasperskiy				f
815	Антивирус Касперский продление	Оригинальный Касперский — кабель и переходник. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1190.00	t	f	f	antivirus-kasperskiy-prodlenie				f
816	Кронштейн для ТВ и мониторов, Deluxe, DLLPA50-443, Макс. нагрузка - 50	Кронштейн для ТВ и мониторов, Deluxe, DLLPA50-443, Макс. нагрузка - 50 — кронштейн или подставка. Гарантия до 2 лет, доставка по Караколу.	2530.00	t	f	f	kronshteyn-dlya-tv-i-monitorov-deluxe-dllpa50-443-maks-nagruzka-50				f
817	Кронштейн потолочный для проектора Brateck\\DELUXE	Кронштейн потолочный для проектора Brateck\\DELUXE — кронштейн или подставка. Гарантия до 2 лет, доставка по Караколу.	1520.00	t	f	f	kronshteyn-potolochnyy-dlya-proektora-brateckdeluxe				f
818	Настенный кронштейн для ТВ и мониторов 42-65 дюймов - 45 кг	Настенный кронштейн для ТВ и мониторов 42-65 дюймов - 45 кг — кронштейн или подставка. Гарантия до 2 лет, доставка по Караколу.	3500.00	t	f	f	nastennyy-kronshteyn-dlya-tv-i-monitorov-42-65-dyuymov-45-kg				f
819	Настенный кронштейн для ТВ и мониторов 65 - 100 дюймов - 55 кг	Настенный кронштейн для ТВ и мониторов 65 - 100 дюймов - 55 кг — кронштейн или подставка. Гарантия до 2 лет, доставка по Караколу.	3500.00	t	f	f	nastennyy-kronshteyn-dlya-tv-i-monitorov-65-100-dyuymov-55-kg				f
820	Амортизаторы	Амортизаторы — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	1500.00	t	f	f	amortizatory				f
821	Колесики	Колесики — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	150.00	t	f	f	kolesiki				f
822	Кресло крутящиеся - с откидной прозрачной спинкой -сетка 855 - черн	Кресло крутящиеся - с откидной прозрачной спинкой -сетка 855 - черн — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	10600.00	t	f	f	kreslo-krutyaschiesya-s-otkidnoy-prozrachnoy-spinkoy-setka-855-chern				f
823	Кресло крутящиеся - качающиеся в ромбик (6911)	Кресло крутящиеся - качающиеся в ромбик (6911) — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	10775.00	t	f	f	kreslo-krutyaschiesya-kachayuschiesya-v-rombik-6911				f
824	Кресло крутящиеся - качающиеся кожа - дорогой дутыш на 120 кг	Кресло крутящиеся - качающиеся кожа - дорогой дутыш на 120 кг — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	18200.00	t	f	f	kreslo-krutyaschiesya-kachayuschiesya-kozha-dorogoy-dutysh-na-120-kg				f
825	Кресло крутящиеся - качающиеся черное "Комфорт" железные ручки	Кресло крутящиеся - качающиеся черное "Комфорт" железные ручки — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	11125.00	t	f	f	kreslo-krutyaschiesya-kachayuschiesya-chernoe-komfort-zheleznye-ruchki				f
826	Кресло крутящиеся - качающиеся черное "Комфорт" с подст для ног	Кресло крутящиеся - качающиеся черное "Комфорт" с подст для ног — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	11750.00	t	f	f	kreslo-krutyaschiesya-kachayuschiesya-chernoe-komfort-s-podst-dlya-nog				f
827	Крестовина	Крестовина — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	1650.00	t	f	f	krestovina				f
828	Стул дермантиновый на железных ножках - с ручками эко-кожа - качеств	Стул дермантиновый на железных ножках - с ручками эко-кожа - качеств — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	4950.00	t	f	f	stul-dermantinovyy-na-zheleznyh-nozhkah-s-ruchkami-eko-kozha-kachestv				f
829	Стул крутящийся - дермантиновый с высокой спинкой (6009)	Стул крутящийся - дермантиновый с высокой спинкой (6009) — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	7300.00	t	f	f	stul-krutyaschiysya-dermantinovyy-s-vysokoy-spinkoy-6009				f
830	Стул крутящийся - экокожа плоская спинка \\черный (131)	Стул крутящийся - экокожа плоская спинка \\черный (131) — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	5300.00	t	f	f	stul-krutyaschiysya-ekokozha-ploskaya-spinka-chernyy-131				f
831	Стул офисный - простой	Стул офисный - простой — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	2780.00	t	f	f	stul-ofisnyy-prostoy				f
832	Стул офисный - простой (Россия)	Стул офисный - простой (Россия) — офисная мебель. Гарантия до 2 лет, доставка по Караколу.	2550.00	t	f	f	stul-ofisnyy-prostoy-rossiya				f
833	Share Q27, i5-12400, 16GB SODIMM DDR4, 1TB SSD m.2 NVMe, 27" FHD IPS C	Оригинальный Share — моноблок. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	60775.00	t	f	f	share-q27-i5-12400-16gb-sodimm-ddr4-1tb-ssd-m2-nvme-27-fhd-ips-c				f
834	Ламинатор А4, COMIX, F9099B, 2 вала, 75-125 мкм, 30 см/мин., Серый	Ламинатор А4, COMIX, F9099B, 2 вала, 75-125 мкм, 30 см/мин., Серый — офисное оборудование. Гарантия до 2 лет, доставка по Караколу.	5270.00	t	f	f	laminator-a4-comix-f9099b-2-vala-75-125-mkm-30-smmin-seryy				f
835	Настольный кронштейн для мониторов Brateck LDT12-T01, 13"-32"	Оригинальный Brateck — офисное оборудование. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2045.00	t	f	f	nastolnyy-kronshteyn-dlya-monitorov-brateck-ldt12-t01-13-32				f
836	Пылесос 1000W	Пылесос 1000W — офисное оборудование. Гарантия до 2 лет, доставка по Караколу.	1820.00	t	f	f	pylesos-1000w				f
837	Samsung Galaxy Tab A11+ (X236) 11" 6/128 GB	Оригинальный Samsung — планшет или аксессуар для планшета. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	28700.00	t	f	f	samsung-galaxy-tab-a11-x236-11-6128-gb				f
838	Чехол для планшета гелевый 10,1" (детский)	Чехол для планшета гелевый 10,1" (детский) — планшет или аксессуар для планшета. Гарантия до 2 лет, доставка по Караколу.	450.00	t	f	f	chehol-dlya-plansheta-gelevyy-101-detskiy				f
839	Охлаждающая подставка для планшета/ноутбука Zalman ZM-NS1000	Оригинальный Zalman — подставка для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2385.00	t	f	f	ohlazhdayuschaya-podstavka-dlya-planshetanoutbuka-zalman-zm-ns1000				f
840	Охлаждающая подставка для планшета/ноутбука Zalman ZM-NS2000	Оригинальный Zalman — подставка для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2950.00	t	f	f	ohlazhdayuschaya-podstavka-dlya-planshetanoutbuka-zalman-zm-ns2000				f
841	Подставка охлажд. для ноутбука ноутбука,Deepcool PAL MINI DP-N114	Подставка охлажд. для ноутбука ноутбука,Deepcool PAL MINI DP-N114 — подставка для ноутбука. Гарантия до 2 лет, доставка по Караколу.	1325.00	t	f	f	podstavka-ohlazhd-dlya-noutbuka-noutbukadeepcool-pal-mini-dp-n114				f
842	Подставка охлаждающая для ноутбука Deepcool N200	Оригинальный DeepCool — подставка для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1255.00	t	f	f	podstavka-ohlazhdayuschaya-dlya-noutbuka-deepcool-n200				f
843	HUB USB- 4Port - дешовый	HUB USB- 4Port - дешовый — компьютерный аксессуар. Гарантия до 2 лет, доставка по Караколу.	605.00	t	f	f	hub-usb-4port-deshovyy				f
844	HUB USB- 7Port - дешовый	HUB USB- 7Port - дешовый — компьютерный аксессуар. Гарантия до 2 лет, доставка по Караколу.	700.00	t	f	f	hub-usb-7port-deshovyy				f
845	USB Разветвитель\\Хаб -7 Port HUB с выключателем 507 3,0	USB Разветвитель\\Хаб -7 Port HUB с выключателем 507 3,0 — компьютерный аксессуар. Гарантия до 2 лет, доставка по Караколу.	830.00	t	f	f	usb-razvetvitelhab-7-port-hub-s-vyklyuchatelem-507-30				f
846	Блок питания от модема 5V / 2А	Блок питания от модема 5V / 2А — компьютерный аксессуар. Гарантия до 2 лет, доставка по Караколу.	520.00	t	f	f	blok-pitaniya-ot-modema-5v-2a				f
847	Блок питания от модема 9V / 2А	Блок питания от модема 9V / 2А — компьютерный аксессуар. Гарантия до 2 лет, доставка по Караколу.	450.00	t	f	f	blok-pitaniya-ot-modema-9v-2a				f
848	Зарядное устройство на ноутбук - 120W	Зарядное устройство на ноутбук - 120W — компьютерный аксессуар. Гарантия до 2 лет, доставка по Караколу.	2915.00	t	f	f	zaryadnoe-ustroystvo-na-noutbuk-120w				f
849	Зарядное устройство на ноутбук - 90W - универсал - SLIM	Зарядное устройство на ноутбук - 90W - универсал - SLIM — компьютерный аксессуар. Гарантия до 2 лет, доставка по Караколу.	2655.00	t	f	f	zaryadnoe-ustroystvo-na-noutbuk-90w-universal-slim				f
850	Рюкзак для ноутбука Lenovo 15.6'' Laptop Everyday Backpack B510	Оригинальный Lenovo — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1565.00	t	f	f	ryukzak-dlya-noutbuka-lenovo-156-laptop-everyday-backpack-b510				f
851	Рюкзак для ноутбука Lenovo B210 15.6'' черный\\ серый	Оригинальный Lenovo — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1485.00	t	f	f	ryukzak-dlya-noutbuka-lenovo-b210-156-chernyy-seryy				f
852	Рюкзак для ноутбука Promate ZEST.Black/Grey/Blue "15,4"	Оригинальный Promate — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2525.00	t	f	f	ryukzak-dlya-noutbuka-promate-zestblackgreyblue-154				f
853	Рюкзак для ноутбука RivaCase 7560 Canvas 15.6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2355.00	t	f	f	ryukzak-dlya-noutbuka-rivacase-7560-canvas-156				f
854	Рюкзак для ноутбука НР Value 15.6	Рюкзак для ноутбука НР Value 15.6 — сумка или рюкзак для ноутбука. Гарантия до 2 лет, доставка по Караколу.	1610.00	t	f	f	ryukzak-dlya-noutbuka-nr-value-156				f
855	Сумка для ноутбука RivaCase 7760 15.6" спортивный.	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2410.00	t	f	f	sumka-dlya-noutbuka-rivacase-7760-156-sportivnyy				f
856	Сумка для ноутбука HP Value K0B38AA Серая 15.6" Водоотталкивающая ткан	Оригинальный HP — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1915.00	t	f	f	sumka-dlya-noutbuka-hp-value-k0b38aa-seraya-156-vodoottalkivayuschaya-tkan				f
857	Сумка для ноутбука RivaCase 5516 15.6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1520.00	t	f	f	sumka-dlya-noutbuka-rivacase-5516-156				f
858	Сумка для ноутбука RivaCase 5517 15.6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1520.00	t	f	f	sumka-dlya-noutbuka-rivacase-5517-156				f
859	Сумка для ноутбука RivaCase 7531 15,6"-16"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2290.00	t	f	f	sumka-dlya-noutbuka-rivacase-7531-156-16				f
860	Сумка для ноутбука RivaCase 7532 15,6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1940.00	t	f	f	sumka-dlya-noutbuka-rivacase-7532-156				f
861	Сумка для ноутбука RivaCase 7731 15,6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2270.00	t	f	f	sumka-dlya-noutbuka-rivacase-7731-156				f
862	Сумка для ноутбука RivaCase 7931 15,6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2530.00	t	f	f	sumka-dlya-noutbuka-rivacase-7931-156				f
863	Сумка для ноутбука RivaCase 8035 Black 15,6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2005.00	t	f	f	sumka-dlya-noutbuka-rivacase-8035-black-156				f
864	Сумка для ноутбука RivaCase 8038 Black 15,6" + мышка!!!	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1870.00	t	f	f	sumka-dlya-noutbuka-rivacase-8038-black-156-myshka				f
865	Сумка для ноутбука RivaCase 8065 Black\\Khaki 15,6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1775.00	t	f	f	sumka-dlya-noutbuka-rivacase-8065-blackkhaki-156				f
866	Сумка для ноутбука RivaCase 8231 Purple\\Black\\Gray\\Blue 15.6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	1935.00	t	f	f	sumka-dlya-noutbuka-rivacase-8231-purpleblackgrayblue-156				f
867	Сумка для ноутбука RivaCase 8630 Black\\Beige\\Red 15.6"	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	2310.00	t	f	f	sumka-dlya-noutbuka-rivacase-8630-blackbeigered-156				f
868	Сумка для цифровой камеры дешев	Сумка для цифровой камеры дешев — сумка или рюкзак для ноутбука. Гарантия до 2 лет, доставка по Караколу.	155.00	t	f	f	sumka-dlya-tsifrovoy-kamery-deshev				f
869	Сумка для цифровой камеры средне-дорогие	Сумка для цифровой камеры средне-дорогие — сумка или рюкзак для ноутбука. Гарантия до 2 лет, доставка по Караколу.	230.00	t	f	f	sumka-dlya-tsifrovoy-kamery-sredne-dorogie				f
870	Сумочка для HDD 2.5" RivaCase 9101	Оригинальный RivaCase — сумка или рюкзак для ноутбука. Качественное решение для дома и офиса. Гарантия до 2 лет, доставка по Караколу.	645.00	t	f	f	sumochka-dlya-hdd-25-rivacase-9101				f
\.


--
-- Data for Name: products_product_brands; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_product_brands (id, product_id, brand_id) FROM stdin;
533	491	362
534	492	363
535	493	363
536	496	372
537	532	372
538	536	368
540	538	345
541	539	345
542	540	373
543	541	374
544	542	374
545	546	345
546	550	345
547	551	345
548	552	345
549	553	345
550	554	320
551	567	332
552	572	362
553	575	375
554	576	375
555	577	375
556	578	375
557	579	375
558	580	376
559	581	377
560	582	378
561	583	334
562	584	379
563	585	364
564	586	365
565	587	365
566	588	365
567	589	365
568	590	365
569	591	365
570	592	365
571	593	365
572	594	380
573	595	365
574	596	365
575	597	374
576	598	368
577	599	381
578	601	365
579	602	380
580	603	382
581	604	368
582	605	383
583	606	383
584	607	383
585	608	323
586	609	325
587	610	325
588	611	325
589	612	325
590	613	325
591	614	320
592	616	375
593	617	376
594	618	375
595	621	366
596	622	337
597	624	385
598	625	385
599	626	385
600	627	385
601	628	367
602	629	367
603	630	386
604	631	386
605	632	387
606	633	327
607	634	365
608	635	365
609	636	365
610	637	365
611	638	365
612	639	365
613	640	365
614	641	365
615	642	365
616	643	365
617	644	365
618	645	365
619	646	365
620	647	365
621	648	365
622	649	365
623	650	365
624	651	365
625	652	365
626	653	365
627	654	365
628	655	365
629	656	368
630	657	368
631	658	368
632	659	365
633	660	365
634	661	365
635	662	365
636	663	388
637	664	388
429	395	320
430	396	320
431	397	320
432	398	320
433	399	321
434	400	321
435	401	321
436	402	321
437	403	322
438	403	323
439	404	322
440	404	324
441	405	322
442	405	325
443	406	322
444	406	323
445	407	321
446	407	325
447	408	321
448	408	325
449	409	321
450	409	323
451	410	320
452	410	323
453	411	323
454	412	325
455	413	323
456	414	324
457	415	349
458	416	324
459	417	325
460	418	323
461	419	332
462	420	331
463	421	347
464	422	348
465	423	348
466	424	354
467	425	355
468	426	332
469	427	326
470	428	334
471	429	332
472	430	348
473	431	326
474	432	334
475	433	333
476	434	334
477	435	356
478	436	333
479	437	331
480	438	339
481	439	340
482	440	338
483	441	350
484	442	331
485	443	345
486	444	339
487	445	338
488	446	351
489	447	352
490	448	331
491	449	353
492	450	339
493	451	344
494	452	345
495	453	339
496	454	346
497	455	331
498	456	338
499	457	352
500	458	361
501	459	326
502	460	327
503	461	323
504	462	328
505	463	325
506	464	343
507	465	323
508	466	327
509	467	323
510	468	330
511	469	337
512	470	360
513	471	360
514	472	328
515	473	329
516	474	330
517	475	335
518	476	336
519	477	335
520	478	336
521	479	342
522	480	359
523	481	342
524	482	336
525	483	335
526	484	357
527	485	358
528	486	331
529	487	341
530	488	342
531	489	336
532	490	335
539	537	368
638	665	388
639	666	388
640	667	380
641	668	380
642	669	380
643	670	380
644	671	381
645	672	381
646	673	381
647	674	381
648	675	381
649	676	383
650	681	365
651	682	365
652	683	365
653	684	389
654	685	389
655	686	389
656	687	382
657	688	365
658	689	375
659	690	382
660	691	382
661	693	380
662	694	382
663	695	382
664	696	382
665	697	370
666	698	365
667	699	365
668	700	365
669	701	365
670	702	365
671	703	365
672	704	390
673	705	380
674	706	380
675	707	380
676	708	380
677	709	370
678	710	370
679	711	365
680	712	391
681	713	391
682	714	375
683	717	366
684	718	375
685	719	375
686	720	375
687	721	375
688	722	392
689	723	366
690	724	366
691	725	366
692	726	366
693	727	366
694	728	393
695	729	366
696	730	366
697	731	366
698	732	366
699	733	366
700	734	394
701	735	394
702	736	366
703	737	366
704	738	366
705	739	393
706	740	393
707	741	393
708	744	372
709	746	337
710	747	337
711	748	337
712	749	329
713	750	329
714	751	329
715	752	330
716	753	330
717	754	373
718	755	368
719	756	368
720	757	368
721	758	381
722	759	378
723	760	378
724	761	378
725	762	378
726	763	378
727	764	378
728	765	369
729	766	395
730	767	320
731	768	320
732	769	320
733	770	320
734	771	320
735	772	320
736	773	370
737	774	370
738	775	370
739	776	370
740	777	370
741	778	370
742	779	370
743	780	370
744	781	370
745	782	370
746	783	370
747	784	370
748	785	370
749	786	380
750	787	370
751	788	370
752	789	370
753	790	370
754	791	370
755	792	382
756	793	382
757	794	382
758	796	382
759	797	382
760	798	390
761	799	390
762	800	396
763	801	397
764	802	398
765	803	398
766	804	398
767	805	323
768	806	399
769	808	400
770	809	401
771	810	401
772	811	401
773	812	401
774	813	401
775	814	402
776	815	402
777	833	371
778	835	403
779	837	326
780	839	404
781	840	404
782	842	345
783	850	330
784	851	330
785	852	405
786	853	406
787	855	406
788	856	329
789	857	406
790	858	406
791	859	406
792	860	406
793	861	406
794	862	406
795	863	406
796	864	406
797	865	406
798	866	406
799	867	406
800	870	406
\.


--
-- Data for Name: products_product_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_product_categories (id, product_id, category_id) FROM stdin;
491	491	229
492	492	229
493	493	229
494	494	229
495	495	229
496	496	229
497	497	229
498	498	229
499	499	229
500	500	229
501	501	229
502	502	229
503	503	229
504	504	229
505	505	229
506	506	229
507	507	229
508	508	229
509	509	229
510	510	229
511	511	229
512	512	229
513	513	229
514	514	229
515	515	229
516	516	229
517	517	229
518	518	229
519	519	229
520	520	229
521	521	229
522	522	229
523	523	229
524	524	229
525	525	229
526	526	229
527	527	229
528	528	229
529	529	229
530	530	229
531	531	229
532	532	229
533	533	229
534	534	229
535	535	229
536	536	207
538	538	207
539	539	207
540	540	207
541	541	207
542	542	207
543	543	232
544	544	208
545	545	208
546	546	208
547	547	208
548	548	208
549	549	208
550	550	208
551	551	208
552	552	208
553	553	208
554	554	208
555	555	233
556	556	233
557	557	233
558	558	233
559	559	233
560	560	233
561	561	233
562	562	234
563	563	234
564	564	234
565	565	234
566	566	234
567	567	234
568	568	234
569	569	234
570	570	234
571	571	234
572	572	205
573	573	205
574	574	205
575	575	204
576	576	204
577	577	204
578	578	204
579	579	204
580	580	204
581	581	204
582	582	204
583	583	204
584	584	204
585	585	204
586	586	221
587	587	221
395	395	200
396	396	200
397	397	200
398	398	200
399	399	200
400	400	200
401	401	200
402	402	200
403	403	201
404	404	201
405	405	201
406	406	201
407	407	201
408	408	201
409	409	201
410	410	201
411	411	202
412	412	202
413	413	202
414	414	202
415	415	202
416	416	202
417	417	202
418	418	202
419	419	203
420	420	203
421	421	203
422	422	203
423	423	203
424	424	203
425	425	203
426	426	203
427	427	204
428	428	204
429	429	204
430	430	204
431	431	204
432	432	204
433	433	205
434	434	205
435	435	205
436	436	205
437	437	206
438	438	206
439	439	206
440	440	206
441	441	206
442	442	206
443	443	206
444	444	206
445	445	207
446	446	207
447	447	207
448	448	207
449	449	207
450	450	207
451	451	208
452	452	208
453	453	208
454	454	208
455	455	208
456	456	208
457	457	208
458	458	208
459	459	217
460	460	217
461	461	217
462	462	219
463	463	217
464	464	218
465	465	218
466	466	217
467	467	213
468	468	213
469	469	213
470	470	215
471	471	214
472	472	215
473	473	214
474	474	215
475	475	222
476	476	222
477	477	222
478	478	222
479	479	222
480	480	222
481	481	221
482	482	221
483	483	221
484	484	221
485	485	221
486	486	221
487	487	223
488	488	223
489	489	223
490	490	223
537	537	207
588	588	221
589	589	221
590	590	221
591	591	221
592	592	221
593	593	221
594	594	221
595	595	221
596	596	221
597	597	221
598	598	221
599	599	221
600	600	221
601	601	221
602	602	221
603	603	221
604	604	221
605	605	221
606	606	221
607	607	221
608	608	202
609	609	202
610	610	202
611	611	202
612	612	202
613	613	202
614	614	202
615	615	203
616	616	203
617	617	203
618	618	203
619	619	203
620	620	203
621	621	235
622	622	216
623	623	216
624	624	216
625	625	216
626	626	216
627	627	216
628	628	216
629	629	216
630	630	216
631	631	216
632	632	216
633	633	216
634	634	222
635	635	222
636	636	222
637	637	222
638	638	222
639	639	222
640	640	222
641	641	222
642	642	224
643	643	222
644	644	224
645	645	220
646	646	222
647	647	222
648	648	222
649	649	222
650	650	222
651	651	222
652	652	222
653	653	222
654	654	222
655	655	222
656	656	220
657	657	220
658	658	220
659	659	224
660	660	224
661	661	224
662	662	222
663	663	224
664	664	222
665	665	224
666	666	222
667	667	222
668	668	222
669	669	222
670	670	222
671	671	222
672	672	222
673	673	222
674	674	222
675	675	222
676	676	222
677	677	224
678	678	224
679	679	224
680	680	224
681	681	224
682	682	224
683	683	224
684	684	222
685	685	222
686	686	222
687	687	222
688	688	231
689	689	231
690	690	223
691	691	223
692	692	223
693	693	223
694	694	223
695	695	223
696	696	223
697	697	223
698	698	223
699	699	223
700	700	223
701	701	223
702	702	223
703	703	223
704	704	223
705	705	223
706	706	223
707	707	223
708	708	223
709	709	223
710	710	223
711	711	223
712	712	229
713	713	229
714	714	229
715	715	229
716	716	229
717	717	235
718	718	235
719	719	235
720	720	235
721	721	235
722	722	235
723	723	235
724	724	235
725	725	235
726	726	235
727	727	235
728	728	235
729	729	235
730	730	235
731	731	235
732	732	235
733	733	235
734	734	235
735	735	235
736	736	235
737	737	235
738	738	235
739	739	235
740	740	235
741	741	235
742	742	229
743	743	229
744	744	229
745	745	229
746	746	215
747	747	215
748	748	215
749	749	215
750	750	215
751	751	215
752	752	215
753	753	215
754	754	206
755	755	206
756	756	206
757	757	206
758	758	206
759	759	206
760	760	206
761	761	206
762	762	206
763	763	206
764	764	206
765	765	227
766	766	226
767	767	200
768	768	200
769	769	200
770	770	200
771	771	200
772	772	200
773	773	236
774	774	236
775	775	236
776	776	236
777	777	236
778	778	236
779	779	236
780	780	236
781	781	236
782	782	236
783	783	236
784	784	236
785	785	236
786	786	236
787	787	236
788	788	236
789	789	236
790	790	236
791	791	236
792	792	236
793	793	236
794	794	236
795	795	236
796	796	236
797	797	236
798	798	236
799	799	236
800	800	237
801	801	237
802	802	237
803	803	237
804	804	237
805	805	201
806	806	201
807	807	237
808	808	237
809	809	229
810	810	229
811	811	229
812	812	229
813	813	229
814	814	229
815	815	229
816	816	238
817	817	238
818	818	238
819	819	238
820	820	239
821	821	239
822	822	239
823	823	239
824	824	239
825	825	239
826	826	239
827	827	239
828	828	239
829	829	239
830	830	239
831	831	239
832	832	239
833	833	240
834	834	241
835	835	241
836	836	241
837	837	242
838	838	242
839	839	243
840	840	243
841	841	243
842	842	243
843	843	228
844	844	228
845	845	228
846	846	228
847	847	228
848	848	228
849	849	228
850	850	230
851	851	230
852	852	230
853	853	230
854	854	230
855	855	230
856	856	230
857	857	230
858	858	230
859	859	230
860	860	230
861	861	230
862	862	230
863	863	230
864	864	230
865	865	230
866	866	230
867	867	230
868	868	230
869	869	230
870	870	230
\.


--
-- Data for Name: products_product_feature_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_product_feature_tags (id, product_id, tag_id) FROM stdin;
1885	532	755
1886	543	819
1887	544	688
1888	581	694
1889	583	694
1890	584	694
1891	585	694
1892	589	688
1893	589	659
1894	590	659
1895	591	803
1896	591	688
1897	591	659
1898	592	803
1899	592	688
1900	592	659
1901	595	820
1902	599	659
1903	600	782
1904	601	782
1905	603	659
1906	604	782
1907	605	659
1908	606	659
1909	607	659
1910	609	746
1911	610	746
1912	611	746
1913	618	746
1914	621	782
1915	622	747
1916	622	748
1917	622	821
1918	623	748
1919	623	746
1920	624	748
1921	624	821
1922	624	754
1923	625	659
1924	625	821
1925	625	754
1926	626	659
1927	626	821
1928	626	754
1929	627	748
1930	627	746
1931	627	659
1932	627	754
1933	628	748
1934	628	821
1935	629	821
1936	629	754
1937	630	747
1938	631	746
1939	631	754
1940	632	746
1941	632	754
1942	633	746
1943	633	754
1944	640	688
1945	641	688
1946	642	688
1947	642	659
1948	643	688
1949	643	659
1950	644	688
1951	644	659
1952	645	659
1953	646	782
1954	647	782
1955	648	782
1956	649	782
1957	650	782
1958	651	782
1959	654	688
1960	654	659
1961	655	688
1962	655	659
1963	659	782
1964	660	782
1965	661	782
1966	662	782
1967	663	659
1968	664	659
1969	665	659
1970	666	659
1971	669	782
1972	670	782
1973	671	659
1974	672	688
1975	672	659
1976	673	659
1977	676	659
1978	681	659
1979	683	659
1980	684	688
1981	686	688
1982	688	821
1983	689	821
1984	692	659
1985	695	659
1986	697	782
1987	698	688
1988	698	659
1989	699	688
1990	699	659
1991	700	688
1992	700	659
1993	701	688
1994	704	822
1995	709	659
1996	710	659
1997	711	688
1998	717	823
1999	727	782
2000	727	824
2001	728	824
2002	729	824
2003	730	824
2004	731	782
2005	732	782
2006	732	824
2007	733	782
2008	733	824
2009	734	782
2010	735	782
2011	736	782
2012	736	824
2013	737	782
2014	737	824
2015	738	782
2016	738	824
2017	739	823
2018	739	782
2019	739	724
2020	739	824
2021	740	823
2022	740	782
2023	740	824
2024	741	823
2025	741	782
2026	741	724
2027	741	824
2028	746	694
2029	748	694
2030	749	821
2031	750	821
2032	752	821
2033	753	821
2034	766	824
2035	772	746
2036	784	688
2037	785	688
2038	785	659
2039	798	782
2040	799	782
2041	800	748
2042	801	748
2043	802	748
2044	803	748
2045	806	659
2046	833	694
2047	833	821
2048	833	754
1482	395	658
1483	395	659
1484	395	660
1485	395	661
1486	396	659
1487	396	660
1488	396	661
1489	397	662
1490	397	659
1491	397	660
1492	397	661
1493	398	663
1494	398	664
1495	398	660
1496	399	658
1497	399	659
1498	399	665
1499	399	666
1500	400	659
1501	400	665
1502	400	666
1503	401	662
1504	401	659
1505	401	666
1506	402	658
1507	402	667
1508	402	668
1509	402	661
1510	403	658
1511	403	659
1512	403	669
1513	403	670
1514	403	671
1515	404	659
1516	404	669
1517	404	670
1518	404	671
1519	405	659
1520	405	669
1521	405	670
1522	405	672
1523	406	662
1524	406	659
1525	406	669
1526	406	670
1527	406	673
1528	407	658
1529	407	659
1530	407	674
1531	407	671
1532	408	659
1533	408	674
1534	408	672
1535	409	662
1536	409	659
1537	409	674
1538	409	673
1539	410	662
1540	410	659
1541	410	675
1542	410	676
1543	411	659
1544	411	677
1545	411	678
1546	411	679
1547	412	659
1548	412	677
1549	412	678
1550	412	679
1551	413	662
1552	413	677
1553	413	678
1554	413	679
1555	414	659
1556	414	677
1557	414	680
1558	414	679
1559	415	662
1560	415	677
1561	415	680
1562	415	681
1563	416	658
1564	416	677
1565	416	680
1566	416	679
1567	417	662
1568	417	682
1569	417	683
1570	417	679
1571	418	658
1572	418	677
1573	418	680
1574	418	684
1575	419	677
1576	419	685
1577	419	686
1578	420	677
1579	420	687
1580	420	688
1581	420	686
1582	421	677
1583	421	689
1584	421	688
1585	421	686
1586	421	684
1587	422	677
1588	422	685
1589	422	686
1590	423	682
1591	423	690
1592	423	686
1593	423	663
1594	424	677
1595	424	687
1596	424	688
1597	424	691
1598	424	686
1599	425	682
1600	425	692
1601	425	663
1602	425	686
1603	426	677
1604	426	693
1605	426	684
1606	426	686
1607	427	694
1608	427	695
1609	427	696
1610	428	694
1611	428	695
1612	428	659
1613	429	694
1614	429	695
1615	429	696
1616	430	694
1617	430	697
1618	430	696
1619	430	698
1620	431	699
1621	431	700
1622	431	701
1623	431	663
1624	432	694
1625	432	695
1626	432	663
1627	432	664
1628	433	702
1629	433	703
1630	433	704
1631	434	702
1632	434	705
1633	434	706
1634	434	707
1635	435	702
1636	435	705
1637	435	706
1638	435	708
1639	436	702
1640	436	705
1641	436	709
1642	436	707
1643	437	710
1644	437	711
1645	437	712
1646	438	713
1647	438	710
1648	438	714
1649	438	715
1650	439	710
1651	439	716
1652	439	712
1653	439	717
1654	440	663
1655	440	718
1656	440	712
1657	440	719
1658	441	710
1659	441	711
1660	441	712
1661	442	710
1662	442	716
1663	442	712
1664	442	720
1665	443	710
1666	443	714
1667	443	712
1668	443	721
1669	444	713
1670	444	722
1671	444	716
1672	444	712
1673	444	721
1674	445	723
1675	445	724
1676	445	688
1677	445	725
1678	446	723
1679	446	726
1680	446	724
1681	446	727
1682	447	723
1683	447	728
1684	447	729
1685	447	725
1686	448	723
1687	448	728
1688	448	663
1689	448	725
1690	449	723
1691	449	730
1692	449	725
1693	449	731
1694	450	723
1695	450	732
1696	450	733
1697	450	710
1698	451	734
1699	451	735
1700	451	736
1701	451	713
1702	451	696
1703	452	734
1704	452	735
1705	452	737
1706	452	663
1707	453	734
1708	453	735
1709	453	737
1710	453	713
1711	454	738
1712	454	739
1713	454	713
1714	454	731
1715	455	738
1716	455	739
1717	455	688
1718	455	740
1719	455	696
1720	456	734
1721	456	741
1722	456	737
1723	456	663
1724	456	688
1725	457	738
1726	457	742
1727	457	688
1728	457	743
1729	458	734
1730	458	735
1731	458	737
1732	458	663
1733	458	744
1734	459	659
1735	459	745
1736	459	746
1737	459	747
1738	459	748
1739	460	659
1740	460	749
1741	460	750
1742	460	746
1743	460	751
1744	461	659
1745	461	752
1746	461	671
1747	461	745
1748	461	658
1749	462	753
1750	462	671
1751	462	754
1752	462	755
1753	462	667
1754	463	659
1755	463	756
1756	463	754
1757	463	746
1758	463	757
1759	464	758
1760	464	671
1761	464	754
1762	464	759
1763	464	755
1764	465	758
1765	465	746
1766	465	754
1767	465	759
1768	465	663
1769	466	659
1770	466	671
1771	466	760
1772	466	750
1773	466	761
1774	467	659
1775	467	762
1776	467	763
1777	467	745
1778	467	752
1779	468	659
1780	468	764
1781	468	765
1782	468	749
1783	469	659
1784	469	762
1785	469	766
1786	469	745
1787	469	767
1788	470	768
1789	470	769
1790	470	770
1791	470	771
1792	471	772
1793	471	773
1794	471	774
1795	471	775
1796	471	771
1797	472	772
1798	472	776
1799	472	752
1800	472	667
1801	473	772
1802	473	777
1803	473	752
1804	473	778
1805	473	776
1806	474	779
1807	474	775
1808	474	780
1809	474	781
1810	475	782
1811	475	783
1812	475	784
1813	475	785
1814	475	786
1815	476	782
1816	476	787
1817	476	788
1818	476	789
1819	477	782
1820	477	688
1821	477	790
1822	477	791
1823	478	782
1824	478	688
1825	478	788
1826	478	792
1827	479	793
1828	479	688
1829	479	794
1830	479	791
1831	479	663
1832	480	793
1833	480	785
1834	480	786
1835	480	795
1836	480	789
1837	481	782
1838	481	796
1839	481	688
1840	481	797
1841	481	798
1842	482	793
1843	482	688
1844	482	799
1845	482	800
1846	482	801
1847	483	782
1848	483	802
1849	483	688
1850	483	797
1851	483	803
1852	484	782
1853	484	688
1854	484	804
1855	484	805
1856	484	806
1857	484	807
1858	485	793
1859	485	688
1860	485	797
1861	485	808
1862	485	809
1863	486	793
1864	486	688
1865	486	799
1866	486	809
1867	486	810
1868	487	782
1869	487	811
1870	487	812
1871	488	782
1872	488	813
1873	488	814
1874	488	658
1875	488	815
1876	489	782
1877	489	816
1878	489	785
1879	489	786
1880	490	782
1881	490	817
1882	490	785
1883	490	786
1884	490	818
\.


--
-- Data for Name: products_productattribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productattribute (id, attribute_id, product_id, value_bool, value_enum, value_int, value_str, variant_id) FROM stdin;
1719	281	536	\N	ATX	\N	ATX	\N
1363	265	395	\N		3	3.2	\N
1720	281	537	\N	ATX	\N	ATX	\N
1364	266	395	\N		6	6.0	\N
1721	281	538	\N	MATX	\N	MATX	\N
1722	281	539	\N	MATX	\N	MATX	\N
1365	267	395	\N		24	24	\N
1723	281	540	\N	ATX	\N	ATX	\N
1366	268	395	\N		32	32	\N
1724	301	544	t		\N	Да	\N
1725	301	546	t		\N	Да	\N
1367	269	395	\N	LGA1700	\N	LGA1700	\N
1726	269	554	\N	LGA1700	\N	LGA1700	\N
1368	271	395	\N		253	253	\N
1727	280	572	\N	HDD	\N	HDD	\N
1728	280	573	\N	HDD	\N	HDD	\N
1369	265	396	\N		3	3.4	\N
1729	280	574	\N	HDD	\N	HDD	\N
1370	266	396	\N		5	5.6	\N
1730	298	575	\N		128	128	\N
1731	280	575	\N	SSD	\N	SSD	\N
1371	267	396	\N		20	20	\N
1732	298	576	\N		256	256	\N
1372	268	396	\N		28	28	\N
1733	280	576	\N	SSD	\N	SSD	\N
1734	298	577	\N		120	120	\N
1373	269	396	\N	LGA1700	\N	LGA1700	\N
1735	280	577	\N	SSD	\N	SSD	\N
1374	271	396	\N		253	253	\N
1736	298	578	\N		240	240	\N
1737	280	578	\N	SSD	\N	SSD	\N
1375	265	397	\N		3	3.5	\N
1738	298	579	\N		480	480	\N
1376	266	397	\N		5	5.3	\N
1739	280	579	\N	SSD	\N	SSD	\N
1740	298	580	\N		128	128	\N
1377	267	397	\N		14	14	\N
1741	280	580	\N	SSD	\N	SSD	\N
1378	268	397	\N		20	20	\N
1742	298	581	\N		8	8	\N
1743	280	581	\N	SSD	\N	SSD	\N
1379	269	397	\N	LGA1700	\N	LGA1700	\N
1744	281	581	\N	M.2 2280	\N	M.2 2280	\N
1380	271	397	\N		181	181	\N
1745	298	582	\N		2	2	\N
1381	265	398	\N		3	3.5	\N
1382	266	398	\N		4	4.7	\N
1383	267	398	\N		4	4	\N
1384	268	398	\N		8	8	\N
1385	269	398	\N	LGA1700	\N	LGA1700	\N
1386	271	398	\N		110	110	\N
1387	265	399	\N		4	4.2	\N
1388	266	399	\N		5	5.7	\N
1389	267	399	\N		16	16	\N
1390	268	399	\N		32	32	\N
1391	269	399	\N	AM5	\N	AM5	\N
1392	271	399	\N		120	120	\N
1393	265	400	\N		4	4.2	\N
1394	266	400	\N		5	5.0	\N
1395	267	400	\N		8	8	\N
1396	268	400	\N		16	16	\N
1397	269	400	\N	AM5	\N	AM5	\N
1398	271	400	\N		120	120	\N
1399	265	401	\N		4	4.7	\N
1400	266	401	\N		5	5.3	\N
1401	267	401	\N		6	6	\N
1402	268	401	\N		12	12	\N
1403	269	401	\N	AM5	\N	AM5	\N
1404	271	401	\N		105	105	\N
1405	265	402	\N		4	4.3	\N
1406	266	402	\N		5	5.7	\N
1407	267	402	\N		16	16	\N
1408	268	402	\N		32	32	\N
1409	269	402	\N	AM5	\N	AM5	\N
1410	271	402	\N		170	170	\N
1411	272	403	\N		24	24	\N
1412	273	403	\N	GDDR6X	\N	GDDR6X	\N
1413	274	403	\N		384	384	\N
1414	272	404	\N		16	16	\N
1415	273	404	\N	GDDR6X	\N	GDDR6X	\N
1416	274	404	\N		256	256	\N
1417	272	405	\N		12	12	\N
1746	280	582	\N	SSD	\N	SSD	\N
1418	273	405	\N	GDDR6X	\N	GDDR6X	\N
1747	298	583	\N		2	2	\N
1748	280	583	\N	SSD	\N	SSD	\N
1419	274	405	\N		192	192	\N
1749	281	583	\N	M.2 2280	\N	M.2 2280	\N
1420	272	406	\N		8	8	\N
1750	298	584	\N		512	512	\N
1751	280	584	\N	SSD	\N	SSD	\N
1421	273	406	\N	GDDR6	\N	GDDR6	\N
1752	281	584	\N	M.2 2280	\N	M.2 2280	\N
1422	274	406	\N		128	128	\N
1753	280	585	\N	NVME	\N	NVME	\N
1754	281	585	\N	M.2 2280	\N	M.2 2280	\N
1423	272	407	\N		24	24	\N
1755	301	589	t		\N	Да	\N
1424	273	407	\N	GDDR6	\N	GDDR6	\N
1756	301	591	t		\N	Да	\N
1757	306	591	t		\N	Да	\N
1425	274	407	\N		384	384	\N
1758	301	592	t		\N	Да	\N
1426	272	408	\N		16	16	\N
1759	306	592	t		\N	Да	\N
1760	301	599	t		\N	Да	\N
1427	273	408	\N	GDDR6	\N	GDDR6	\N
1761	302	600	t		\N	Да	\N
1428	274	408	\N		256	256	\N
1762	302	601	t		\N	Да	\N
1763	302	604	t		\N	Да	\N
1429	272	409	\N		8	8	\N
1764	269	608	\N	LGA1151	\N	LGA1151	\N
1430	273	409	\N	GDDR6	\N	GDDR6	\N
1765	269	609	\N	LGA1700	\N	LGA1700	\N
1766	276	609	\N	DDR5	\N	DDR5	\N
1431	274	409	\N		128	128	\N
1767	269	610	\N	LGA1700	\N	LGA1700	\N
1432	272	410	\N		16	16	\N
1768	276	610	\N	DDR4	\N	DDR4	\N
1769	269	611	\N	LGA1700	\N	LGA1700	\N
1433	273	410	\N	GDDR6	\N	GDDR6	\N
1770	276	611	\N	DDR4	\N	DDR4	\N
1434	274	410	\N		256	256	\N
1771	269	612	\N	LGA1200	\N	LGA1200	\N
1772	269	613	\N	LGA1200	\N	LGA1200	\N
1435	269	411	\N	LGA1700	\N	LGA1700	\N
1436	276	411	\N	DDR5	\N	DDR5	\N
1437	281	411	\N	ATX	\N	ATX	\N
1438	269	412	\N	LGA1700	\N	LGA1700	\N
1439	276	412	\N	DDR5	\N	DDR5	\N
1440	281	412	\N	ATX	\N	ATX	\N
1441	269	413	\N	LGA1700	\N	LGA1700	\N
1442	276	413	\N	DDR5	\N	DDR5	\N
1443	281	413	\N	ATX	\N	ATX	\N
1444	269	414	\N	AM5	\N	AM5	\N
1445	276	414	\N	DDR5	\N	DDR5	\N
1446	281	414	\N	ATX	\N	ATX	\N
1447	269	415	\N	AM5	\N	AM5	\N
1448	276	415	\N	DDR5	\N	DDR5	\N
1449	281	415	\N	microATX	\N	microATX	\N
1450	269	416	\N	AM5	\N	AM5	\N
1451	276	416	\N	DDR5	\N	DDR5	\N
1452	281	416	\N	ATX	\N	ATX	\N
1453	269	417	\N	AM4	\N	AM4	\N
1454	276	417	\N	DDR4	\N	DDR4	\N
1455	281	417	\N	ATX	\N	ATX	\N
1456	269	418	\N	AM5	\N	AM5	\N
1457	276	418	\N	DDR5	\N	DDR5	\N
1458	281	418	\N	ATX	\N	ATX	\N
1459	275	419	\N		32	32	\N
1460	276	419	\N	DDR5	\N	DDR5	\N
1461	277	419	\N		5600	5600	\N
1462	278	419	\N		2	2	\N
1463	275	420	\N		32	32	\N
1464	276	420	\N	DDR5	\N	DDR5	\N
1465	277	420	\N		6000	6000	\N
1466	278	420	\N		2	2	\N
1467	275	421	\N		32	32	\N
1468	276	421	\N	DDR5	\N	DDR5	\N
1469	277	421	\N		6400	6400	\N
1470	278	421	\N		2	2	\N
1471	275	422	\N		32	32	\N
1472	276	422	\N	DDR5	\N	DDR5	\N
1473	277	422	\N		5600	5600	\N
1773	281	613	\N	mATX	\N	mATX	\N
1774	269	614	\N	LGA1851	\N	LGA1851	\N
1474	278	422	\N		2	2	\N
1775	276	615	\N	DDR3	\N	DDR3	\N
1475	275	423	\N		32	32	\N
1776	275	616	\N		16	16	\N
1777	276	616	\N	DDR4	\N	DDR4	\N
1476	276	423	\N	DDR4	\N	DDR4	\N
1778	275	617	\N		16	16	\N
1477	277	423	\N		3200	3200	\N
1779	276	617	\N	DDR4	\N	DDR4	\N
1780	275	618	\N		16	16	\N
1478	278	423	\N		2	2	\N
1781	276	618	\N	DDR4	\N	DDR4	\N
1479	275	424	\N		64	64	\N
1782	276	619	\N	DDR4	\N	DDR4	\N
1783	276	620	\N	DDR4	\N	DDR4	\N
1480	276	424	\N	DDR5	\N	DDR5	\N
1784	302	621	t		\N	Да	\N
1481	277	424	\N		6000	6000	\N
1785	287	622	\N		\N	27	\N
1786	288	622	\N		\N	1920x1080	\N
1482	278	424	\N		2	2	\N
1787	289	622	\N	VA	\N	VA	\N
1483	275	425	\N		16	16	\N
1788	292	622	t		\N	Да	\N
1484	276	425	\N	DDR4	\N	DDR4	\N
1789	287	623	\N		\N	32	\N
1790	288	623	\N		\N	2560x1440	\N
1485	277	425	\N		3600	3600	\N
1791	290	623	\N		180	180	\N
1486	278	425	\N		2	2	\N
1792	289	623	\N	VA	\N	VA	\N
1793	287	624	\N		\N	27	\N
1487	275	426	\N		32	32	\N
1794	288	624	\N		\N	1920x1080	\N
1488	276	426	\N	DDR5	\N	DDR5	\N
1795	290	624	\N		100	100	\N
1796	289	624	\N	VA	\N	VA	\N
1489	277	426	\N		7200	7200	\N
1797	301	624	t		\N	Да	\N
1490	278	426	\N		2	2	\N
1798	287	625	\N		\N	27	\N
1491	279	427	\N		2000	2000	\N
1492	280	427	\N	NVMe	\N	NVMe	\N
1493	281	427	\N	M.2 2280	\N	M.2 2280	\N
1494	282	427	\N		7450	7450	\N
1495	283	427	\N		6900	6900	\N
1496	279	428	\N		1000	1000	\N
1497	280	428	\N	NVMe	\N	NVMe	\N
1498	281	428	\N	M.2 2280	\N	M.2 2280	\N
1499	282	428	\N		7300	7300	\N
1500	283	428	\N		6300	6300	\N
1501	279	429	\N		2000	2000	\N
1502	280	429	\N	NVMe	\N	NVMe	\N
1503	281	429	\N	M.2 2280	\N	M.2 2280	\N
1504	282	429	\N		7000	7000	\N
1505	283	429	\N		7000	7000	\N
1506	279	430	\N		1000	1000	\N
1507	280	430	\N	NVMe	\N	NVMe	\N
1508	281	430	\N	M.2 2280	\N	M.2 2280	\N
1509	282	430	\N		11700	11700	\N
1510	283	430	\N		9500	9500	\N
1511	279	431	\N		1000	1000	\N
1512	280	431	\N	SSD	\N	SSD	\N
1513	281	431	\N	2.5"	\N	2.5"	\N
1514	282	431	\N		560	560	\N
1515	283	431	\N		530	530	\N
1516	279	432	\N		1000	1000	\N
1517	280	432	\N	NVMe	\N	NVMe	\N
1518	281	432	\N	M.2 2280	\N	M.2 2280	\N
1519	282	432	\N		4150	4150	\N
1520	283	432	\N		4150	4150	\N
1521	279	433	\N		4000	4000	\N
1522	280	433	\N	HDD	\N	HDD	\N
1523	281	433	\N	3.5"	\N	3.5"	\N
1524	279	434	\N		8000	8000	\N
1525	280	434	\N	HDD	\N	HDD	\N
1526	281	434	\N	3.5"	\N	3.5"	\N
1527	279	435	\N		12000	12000	\N
1528	280	435	\N	HDD	\N	HDD	\N
1799	288	625	\N		\N	1920x1080	\N
1800	290	625	\N		144	144	\N
1529	281	435	\N	3.5"	\N	3.5"	\N
1801	289	625	\N	IPS	\N	IPS	\N
1530	279	436	\N		4000	4000	\N
1802	287	626	\N		\N	27	\N
1803	288	626	\N		\N	1920x1080	\N
1531	280	436	\N	HDD	\N	HDD	\N
1804	290	626	\N		180	180	\N
1532	281	436	\N	3.5"	\N	3.5"	\N
1805	289	626	\N	IPS	\N	IPS	\N
1806	287	627	\N		\N	27	\N
1533	284	437	\N		850	850	\N
1807	290	627	\N		180	180	\N
1534	285	437	\N	80+ Gold	\N	80+ Gold	\N
1808	289	627	\N	VA	\N	VA	\N
1809	287	628	\N		\N	24	\N
1535	286	437	\N	Fully modular	\N	Fully modular	\N
1810	290	628	\N		100	100	\N
1536	284	438	\N		1000	1000	\N
1811	289	628	\N	VA	\N	VA	\N
1812	301	628	t		\N	Да	\N
1537	285	438	\N	80+ Titanium	\N	80+ Titanium	\N
1813	287	629	\N		\N	27	\N
1538	286	438	\N	Fully modular	\N	Fully modular	\N
1814	289	629	\N	IPS	\N	IPS	\N
1815	301	629	t		\N	Да	\N
1539	284	439	\N		750	750	\N
1816	287	630	\N		\N	27	\N
1548	284	442	\N		750	750	\N
1817	290	630	\N		280	280	\N
1549	285	442	\N	80+ Gold	\N	80+ Gold	\N
1818	292	630	t		\N	Да	\N
1550	286	442	\N	Fully modular	\N	Fully modular	\N
1819	287	631	\N		\N	27	\N
1820	288	631	\N		\N	2560x1440	\N
1551	284	443	\N		1000	1000	\N
1821	290	631	\N		180	180	\N
1552	285	443	\N	80+ Gold	\N	80+ Gold	\N
1822	289	631	\N	FAST IPS	\N	FAST IPS	\N
1823	287	632	\N		\N	27	\N
1553	286	443	\N	Fully modular	\N	Fully modular	\N
1824	288	632	\N		\N	2560x1440	\N
1554	284	444	\N		750	750	\N
1555	285	444	\N	80+ Gold	\N	80+ Gold	\N
1556	286	444	\N	Semi-modular	\N	Semi-modular	\N
1557	301	445	t		\N	Да	\N
1558	300	445	\N		\N	Black	\N
1559	301	446	f		\N	Нет	\N
1560	300	446	\N		\N	Charcoal Black	\N
1540	285	439	\N	80+ Gold	\N	80+ Gold	\N
1541	286	439	\N	Fully modular	\N	Fully modular	\N
1561	301	447	f		\N	Нет	\N
1542	284	440	\N		650	650	\N
1543	285	440	\N	80+ Gold	\N	80+ Gold	\N
1544	286	440	\N	Non-modular	\N	Non-modular	\N
1545	284	441	\N		850	850	\N
1546	285	441	\N	80+ Gold	\N	80+ Gold	\N
1547	286	441	\N	Fully modular	\N	Fully modular	\N
1562	300	447	\N		\N	White	\N
1563	301	448	f		\N	Нет	\N
1564	300	448	\N		\N	Black	\N
1565	301	449	f		\N	Нет	\N
1566	300	449	\N		\N	White	\N
1567	301	450	f		\N	Нет	\N
1568	300	450	\N		\N	Black	\N
1569	300	451	\N		\N	Black	\N
1570	300	452	\N		\N	Black	\N
1571	300	453	\N		\N	Black	\N
1572	300	454	\N		\N	Black	\N
1573	301	455	t		\N	Да	\N
1574	300	455	\N		\N	Black	\N
1575	301	456	t		\N	Да	\N
1576	300	456	\N		\N	Black	\N
1577	301	457	t		\N	Да	\N
1578	300	457	\N		\N	Black	\N
1579	300	458	\N		\N	Silver	\N
1580	287	459	\N		\N	27"	\N
1581	288	459	\N		\N	2560×1440 (QHD)	\N
1582	289	459	\N	VA	\N	VA	\N
1825	290	632	\N		240	240	\N
1583	290	459	\N		240	240	\N
1826	289	632	\N	IPS	\N	IPS	\N
1603	289	462	\N	IPS	\N	IPS	\N
1827	287	633	\N		\N	29	\N
1828	288	633	\N		\N	2560x1080	\N
1829	290	633	\N		100	100	\N
1604	290	462	\N		60	60	\N
1584	291	459	\N		1	1	\N
1830	289	633	\N	IPS	\N	IPS	\N
1585	292	459	t		\N	Да	\N
1831	301	640	t		\N	Да	\N
1832	301	641	t		\N	Да	\N
1833	301	642	t		\N	Да	\N
1605	291	462	\N		4	4	\N
1586	293	459	\N		350	350	\N
1834	301	643	t		\N	Да	\N
1587	287	460	\N		\N	27"	\N
1835	301	644	t		\N	Да	\N
1606	292	462	f		\N	Нет	\N
1836	302	646	t		\N	Да	\N
1837	302	647	t		\N	Да	\N
1607	293	462	\N		350	350	\N
1588	288	460	\N		\N	2560×1440 (QHD)	\N
1838	302	648	t		\N	Да	\N
1839	302	649	t		\N	Да	\N
1589	289	460	\N	Nano IPS	\N	Nano IPS	\N
1840	302	650	t		\N	Да	\N
1841	302	651	t		\N	Да	\N
1608	287	463	\N		\N	27"	\N
1842	301	654	t		\N	Да	\N
1590	290	460	\N		165	165	\N
1843	301	655	t		\N	Да	\N
1591	291	460	\N		1	1	\N
1844	302	659	t		\N	Да	\N
1609	288	463	\N		\N	2560×1440 (QHD)	\N
1845	302	660	t		\N	Да	\N
1846	302	661	t		\N	Да	\N
1610	289	463	\N	IPS	\N	IPS	\N
1592	292	460	f		\N	Нет	\N
1847	302	662	t		\N	Да	\N
1848	302	669	t		\N	Да	\N
1593	293	460	\N		400	400	\N
1849	302	670	t		\N	Да	\N
1850	301	672	t		\N	Да	\N
1611	290	463	\N		170	170	\N
1851	288	682	\N		\N	250x200	\N
1594	287	461	\N		\N	32"	\N
1595	288	461	\N		\N	3840×2160 (4K)	\N
1612	291	463	\N		1	1	\N
1613	292	463	f		\N	Нет	\N
1596	289	461	\N	OLED	\N	OLED	\N
1614	293	463	\N		350	350	\N
1615	287	464	\N		\N	27"	\N
1597	290	461	\N		240	240	\N
1598	291	461	\N		0	0.03	\N
1599	292	461	f		\N	Нет	\N
1600	293	461	\N		1000	1000	\N
1601	287	462	\N		\N	27"	\N
1602	288	462	\N		\N	3840×2160 (4K)	\N
1616	288	464	\N		\N	3840×2160 (4K)	\N
1617	289	464	\N	IPS	\N	IPS	\N
1618	290	464	\N		60	60	\N
1619	291	464	\N		5	5	\N
1620	292	464	f		\N	Нет	\N
1621	293	464	\N		350	350	\N
1622	287	465	\N		\N	27"	\N
1623	288	465	\N		\N	2560×1440 (QHD)	\N
1624	289	465	\N	IPS	\N	IPS	\N
1625	290	465	\N		75	75	\N
1626	291	465	\N		5	5	\N
1627	292	465	f		\N	Нет	\N
1628	293	465	\N		350	350	\N
1629	287	466	\N		\N	27"	\N
1630	288	466	\N		\N	3840×2160 (4K)	\N
1631	289	466	\N	Nano IPS	\N	Nano IPS	\N
1632	290	466	\N		144	144	\N
1633	291	466	\N		1	1	\N
1634	292	466	f		\N	Нет	\N
1635	293	466	\N		600	600	\N
1636	294	467	\N		\N	16"	\N
1637	295	467	\N		\N	Intel Core Ultra 9 285H	\N
1852	301	684	t		\N	Да	\N
1658	296	471	\N		\N	Integrated 10-core	\N
1853	301	686	t		\N	Да	\N
1659	297	471	\N		16	16	\N
1854	302	697	t		\N	Да	\N
1638	296	467	\N		\N	NVIDIA RTX 4070 8GB	\N
1855	301	698	t		\N	Да	\N
1856	301	699	t		\N	Да	\N
1660	298	471	\N		256	256	\N
1857	301	700	t		\N	Да	\N
1639	297	467	\N		32	32	\N
1858	301	701	t		\N	Да	\N
1661	294	472	\N		\N	15.6"	\N
1859	302	704	t		\N	Да	\N
1662	295	472	\N		\N	Intel Core i7-13700H	\N
1860	301	711	t		\N	Да	\N
1640	298	467	\N		1000	1000	\N
1861	302	727	t		\N	Да	\N
1862	302	728	t		\N	Да	\N
1663	296	472	\N		\N	NVIDIA RTX 4060 6GB	\N
1863	302	729	t		\N	Да	\N
1641	294	468	\N		\N	16"	\N
1864	302	730	t		\N	Да	\N
1664	297	472	\N		16	16	\N
1865	302	731	t		\N	Да	\N
1866	302	732	t		\N	Да	\N
1665	298	472	\N		512	512	\N
1642	295	468	\N		\N	Intel Core i9-14900HX	\N
1867	302	733	t		\N	Да	\N
1868	302	734	t		\N	Да	\N
1666	294	473	\N		\N	16"	\N
1869	302	735	t		\N	Да	\N
1643	296	468	\N		\N	NVIDIA RTX 4060 8GB	\N
1870	302	736	t		\N	Да	\N
1667	295	473	\N		\N	Intel Core Ultra 7 155H	\N
1871	302	737	t		\N	Да	\N
1668	296	473	\N		\N	Intel Arc Integrated	\N
1872	302	738	t		\N	Да	\N
1669	297	473	\N		16	16	\N
1873	302	739	t		\N	Да	\N
1874	302	740	t		\N	Да	\N
1670	298	473	\N		1000	1000	\N
1875	302	741	t		\N	Да	\N
1671	294	474	\N		\N	14"	\N
1876	295	746	\N		\N	N4500	\N
1672	295	474	\N		\N	Intel Core Ultra 7 155H	\N
1877	298	746	\N		256	256	\N
1673	296	474	\N		\N	Intel Arc Integrated	\N
1878	280	746	\N	SSD	\N	SSD	\N
1674	297	474	\N		32	32	\N
1879	295	747	\N		\N	RYZEN 5 7430U	\N
1675	298	474	\N		1000	1000	\N
1676	299	474	\N		\N	1.09 kg	\N
1677	302	475	t		\N	Да	\N
1678	300	475	\N		\N	Black	\N
1679	302	476	t		\N	Да	\N
1680	300	476	\N		\N	Black	\N
1644	297	468	\N		16	16	\N
1645	298	468	\N		1000	1000	\N
1646	294	469	\N		\N	16"	\N
1647	295	469	\N		\N	Intel Core i7-14700HX	\N
1648	296	469	\N		\N	NVIDIA RTX 4070 8GB	\N
1649	297	469	\N		16	16	\N
1650	298	469	\N		1000	1000	\N
1651	294	470	\N		\N	16.2"	\N
1652	295	470	\N		\N	Apple M4 Pro	\N
1653	296	470	\N		\N	Integrated 20-core	\N
1654	297	470	\N		24	24	\N
1655	298	470	\N		512	512	\N
1656	294	471	\N		\N	15.3"	\N
1657	295	471	\N		\N	Apple M4	\N
1681	302	477	t		\N	Да	\N
1682	301	477	t		\N	Да	\N
1683	300	477	\N		\N	Black	\N
1684	302	478	t		\N	Да	\N
1685	301	478	t		\N	Да	\N
1686	300	478	\N		\N	Black	\N
1687	302	479	f		\N	Нет	\N
1688	301	479	t		\N	Да	\N
1689	300	479	\N		\N	Black	\N
1690	302	480	f		\N	Нет	\N
1691	301	480	f		\N	Нет	\N
1692	300	480	\N		\N	Black	\N
1880	298	747	\N		2	2	\N
1881	280	747	\N	SSD	\N	SSD	\N
1882	294	748	\N		\N	15.6	\N
1883	295	748	\N		\N	I7-13620H	\N
1884	275	748	\N		32	32	\N
1885	298	748	\N		1	1	\N
1886	276	748	\N	DDR4	\N	DDR4	\N
1887	280	748	\N	SSD	\N	SSD	\N
1888	294	749	\N		\N	15.6	\N
1889	295	749	\N		\N	RYZEN 3 7320U	\N
1890	275	749	\N		256	256	\N
1891	301	749	t		\N	Да	\N
1892	294	750	\N		\N	15.6	\N
1893	295	750	\N		\N	ATHLON SILVER 7120U	\N
1894	298	750	\N		6	6	\N
1693	303	481	t		\N	Да	\N
1694	301	481	t		\N	Да	\N
1695	302	481	t		\N	Да	\N
1696	303	482	t		\N	Да	\N
1697	301	482	t		\N	Да	\N
1698	302	482	f		\N	Нет	\N
1699	303	483	t		\N	Да	\N
1700	301	483	t		\N	Да	\N
1701	302	483	t		\N	Да	\N
1702	303	484	t		\N	Да	\N
1703	301	484	t		\N	Да	\N
1704	302	484	t		\N	Да	\N
1705	303	485	t		\N	Да	\N
1706	301	485	t		\N	Да	\N
1707	302	485	f		\N	Нет	\N
1708	303	486	t		\N	Да	\N
1709	301	486	t		\N	Да	\N
1710	302	486	f		\N	Нет	\N
1711	302	487	t		\N	Да	\N
1712	301	487	f		\N	Нет	\N
1713	302	488	t		\N	Да	\N
1714	301	488	f		\N	Нет	\N
1715	302	489	t		\N	Да	\N
1716	301	489	f		\N	Нет	\N
1717	302	490	t		\N	Да	\N
1718	301	490	f		\N	Нет	\N
1895	280	750	\N	SSD	\N	SSD	\N
1896	294	751	\N		\N	15.6	\N
1897	275	751	\N		16	16	\N
1898	298	751	\N		512	512	\N
1899	276	751	\N	DDR4	\N	DDR4	\N
1900	280	751	\N	SSD	\N	SSD	\N
1901	294	752	\N		\N	15.6	\N
1902	288	752	\N		\N	1920x108	\N
1903	295	752	\N		\N	N4500	\N
1904	275	752	\N		512	512	\N
1905	294	753	\N		\N	15.6	\N
1906	295	753	\N		\N	I3-1315U	\N
1907	298	753	\N		6	6	\N
1908	280	753	\N	SSD	\N	SSD	\N
1909	284	754	\N		400	400	\N
1910	281	754	\N	ATX	\N	ATX	\N
1911	284	755	\N		280	280	\N
1912	284	756	\N		420	420	\N
1913	284	757	\N		480	480	\N
1914	284	758	\N		700	700	\N
1915	281	758	\N	ATX	\N	ATX	\N
1916	284	759	\N		500	500	\N
1917	281	759	\N	ATX	\N	ATX	\N
1918	284	760	\N		650	650	\N
1919	281	760	\N	ATX	\N	ATX	\N
1920	284	761	\N		800	800	\N
1921	281	761	\N	ATX	\N	ATX	\N
1922	284	762	\N		500	500	\N
1923	284	763	\N		400	400	\N
1924	284	764	\N		350	350	\N
1925	302	766	t		\N	Да	\N
1926	295	767	\N		\N	CORE I3-10105	\N
1927	269	767	\N	LGA1200	\N	LGA1200	\N
1928	295	768	\N		\N	CORE I3-12100	\N
1929	269	768	\N	LGA1700	\N	LGA1700	\N
1930	295	769	\N		\N	CORE I3-14100	\N
1931	269	769	\N	LGA1700	\N	LGA1700	\N
1932	295	770	\N		\N	CORE I5-12400	\N
1933	269	770	\N	LGA1700	\N	LGA1700	\N
1934	295	771	\N		\N	CORE I5-13400	\N
1935	269	771	\N	LGA1700	\N	LGA1700	\N
1936	295	772	\N		\N	CORE I5-14400	\N
1937	269	772	\N	LGA1700	\N	LGA1700	\N
1938	301	784	t		\N	Да	\N
1939	301	785	t		\N	Да	\N
1940	302	798	t		\N	Да	\N
1941	302	799	t		\N	Да	\N
1942	272	805	\N		6	6	\N
1943	272	806	\N		8	8	\N
1944	294	833	\N		\N	27	\N
1945	289	833	\N	IPS	\N	IPS	\N
1946	295	833	\N		\N	I5-12400	\N
1947	275	833	\N		16	16	\N
1948	298	833	\N		1	1	\N
1949	276	833	\N	DDR4	\N	DDR4	\N
1950	294	837	\N		\N	11	\N
1951	294	838	\N		\N	10.1	\N
\.


--
-- Data for Name: products_productimage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productimage (id, image, is_main, product_id, alt_text, image_type, sort_order, variant_id, provenance) FROM stdin;
1396	product_images/intel-core-i9-14900k_0.jpg	t	395	Intel Core i9-14900K	main	0	\N	web
1397	product_images/intel-core-i9-14900k_1.webp	f	395	Intel Core i9-14900K	gallery	1	\N	web
1398	product_images/intel-core-i9-14900k_2.jpg	f	395	Intel Core i9-14900K	gallery	2	\N	web
1399	product_images/intel-core-i7-14700k_0.jpg	t	396	Intel Core i7-14700K	main	0	\N	web
1400	product_images/intel-core-i7-14700k_1.png	f	396	Intel Core i7-14700K	gallery	1	\N	web
1401	product_images/intel-core-i7-14700k_2.jpg	f	396	Intel Core i7-14700K	gallery	2	\N	web
1402	product_images/intel-core-i5-14600k_0.webp	t	397	Intel Core i5-14600K	main	0	\N	web
1403	product_images/intel-core-i5-14600k_1.png	f	397	Intel Core i5-14600K	gallery	1	\N	web
1404	product_images/intel-core-i5-14600k_4.jpg	f	397	Intel Core i5-14600K	gallery	4	\N	web
1405	product_images/intel-core-i3-14100f_0.jpg	t	398	Intel Core i3-14100F	main	0	\N	web
1406	product_images/intel-core-i3-14100f_1.jpg	f	398	Intel Core i3-14100F	gallery	1	\N	web
1407	product_images/intel-core-i3-14100f_2.jpg	f	398	Intel Core i3-14100F	gallery	2	\N	web
1408	product_images/amd-ryzen-9-7950x3d_0.jpg	t	399	AMD Ryzen 9 7950X3D	main	0	\N	web
1409	product_images/amd-ryzen-9-7950x3d_2.jpg	f	399	AMD Ryzen 9 7950X3D	gallery	2	\N	web
1410	product_images/amd-ryzen-9-7950x3d_3.jpg	f	399	AMD Ryzen 9 7950X3D	gallery	3	\N	web
1411	product_images/amd-ryzen-7-7800x3d_0.jpg	t	400	AMD Ryzen 7 7800X3D	main	0	\N	web
1412	product_images/amd-ryzen-7-7800x3d_1.jpg	f	400	AMD Ryzen 7 7800X3D	gallery	1	\N	web
1413	product_images/amd-ryzen-7-7800x3d_2.jpg	f	400	AMD Ryzen 7 7800X3D	gallery	2	\N	web
1414	product_images/amd-ryzen-5-7600x_0.jpg	t	401	AMD Ryzen 5 7600X	main	0	\N	web
1415	product_images/amd-ryzen-5-7600x_1.jpg	f	401	AMD Ryzen 5 7600X	gallery	1	\N	web
1416	product_images/amd-ryzen-5-7600x_2.jpg	f	401	AMD Ryzen 5 7600X	gallery	2	\N	web
1417	product_images/amd-ryzen-9-9950x_1.jpg	f	402	AMD Ryzen 9 9950X	gallery	1	\N	web
1418	product_images/amd-ryzen-9-9950x_2.jpg	f	402	AMD Ryzen 9 9950X	gallery	2	\N	web
1419	product_images/amd-ryzen-9-9950x_3.jpg	f	402	AMD Ryzen 9 9950X	gallery	3	\N	web
1420	product_images/nvidia-geforce-rtx-4090_0.png	t	403	NVIDIA GeForce RTX 4090	main	0	\N	web
1421	product_images/nvidia-geforce-rtx-4090_3.jpg	f	403	NVIDIA GeForce RTX 4090	gallery	3	\N	web
1422	product_images/nvidia-geforce-rtx-4090_5.jpg	f	403	NVIDIA GeForce RTX 4090	gallery	5	\N	web
1423	product_images/nvidia-geforce-rtx-4080-super_1.jpg	f	404	NVIDIA GeForce RTX 4080 Super	gallery	1	\N	web
1424	product_images/nvidia-geforce-rtx-4080-super_2.jpg	f	404	NVIDIA GeForce RTX 4080 Super	gallery	2	\N	web
1425	product_images/nvidia-geforce-rtx-4080-super_3.jpg	f	404	NVIDIA GeForce RTX 4080 Super	gallery	3	\N	web
1426	product_images/nvidia-geforce-rtx-4070-super_0.jpg	t	405	NVIDIA GeForce RTX 4070 Super	main	0	\N	web
1427	product_images/nvidia-geforce-rtx-4070-super_1.jpg	f	405	NVIDIA GeForce RTX 4070 Super	gallery	1	\N	web
1428	product_images/nvidia-geforce-rtx-4070-super_3.jpg	f	405	NVIDIA GeForce RTX 4070 Super	gallery	3	\N	web
1429	product_images/nvidia-geforce-rtx-4060-ti_1.jpg	f	406	NVIDIA GeForce RTX 4060 Ti	gallery	1	\N	web
1430	product_images/nvidia-geforce-rtx-4060-ti_2.png	f	406	NVIDIA GeForce RTX 4060 Ti	gallery	2	\N	web
1431	product_images/nvidia-geforce-rtx-4060-ti_3.jpg	f	406	NVIDIA GeForce RTX 4060 Ti	gallery	3	\N	web
1432	product_images/amd-radeon-rx-7900-xtx_0.jpg	t	407	AMD Radeon RX 7900 XTX	main	0	\N	web
1433	product_images/amd-radeon-rx-7900-xtx_1.webp	f	407	AMD Radeon RX 7900 XTX	gallery	1	\N	web
1434	product_images/amd-radeon-rx-7900-xtx_2.png	f	407	AMD Radeon RX 7900 XTX	gallery	2	\N	web
1435	product_images/amd-radeon-rx-7800-xt_0.jpg	t	408	AMD Radeon RX 7800 XT	main	0	\N	web
1436	product_images/amd-radeon-rx-7800-xt_1.jpg	f	408	AMD Radeon RX 7800 XT	gallery	1	\N	web
1437	product_images/amd-radeon-rx-7800-xt_2.jpg	f	408	AMD Radeon RX 7800 XT	gallery	2	\N	web
1438	product_images/amd-radeon-rx-7600_0.jpg	t	409	AMD Radeon RX 7600	main	0	\N	web
1439	product_images/amd-radeon-rx-7600_1.jpg	f	409	AMD Radeon RX 7600	gallery	1	\N	web
1440	product_images/amd-radeon-rx-7600_2.jpg	f	409	AMD Radeon RX 7600	gallery	2	\N	web
1441	product_images/intel-arc-a770-16gb_1.jpg	f	410	Intel Arc A770 16GB	gallery	1	\N	web
1442	product_images/intel-arc-a770-16gb_2.jpg	f	410	Intel Arc A770 16GB	gallery	2	\N	web
1443	product_images/intel-arc-a770-16gb_4.jpg	f	410	Intel Arc A770 16GB	gallery	4	\N	web
1444	product_images/asus-rog-strix-z790-f-gaming-wifi_1.jpg	f	411	ASUS ROG STRIX Z790-F Gaming WiFi	gallery	1	\N	web
1445	product_images/asus-rog-strix-z790-f-gaming-wifi_2.png	f	411	ASUS ROG STRIX Z790-F Gaming WiFi	gallery	2	\N	web
1446	product_images/asus-rog-strix-z790-f-gaming-wifi_3.jpg	f	411	ASUS ROG STRIX Z790-F Gaming WiFi	gallery	3	\N	web
1447	product_images/gigabyte-z790-aorus-elite-ax_0.png	t	412	Gigabyte Z790 AORUS Elite AX	main	0	\N	web
1448	product_images/gigabyte-z790-aorus-elite-ax_1.jpg	f	412	Gigabyte Z790 AORUS Elite AX	gallery	1	\N	web
1449	product_images/gigabyte-z790-aorus-elite-ax_2.png	f	412	Gigabyte Z790 AORUS Elite AX	gallery	2	\N	web
1450	product_images/asus-tuf-gaming-b760-plus-wifi_0.png	t	413	ASUS TUF Gaming B760-PLUS WiFi	main	0	\N	web
1451	product_images/asus-tuf-gaming-b760-plus-wifi_3.jpg	f	413	ASUS TUF Gaming B760-PLUS WiFi	gallery	3	\N	web
1452	product_images/asus-tuf-gaming-b760-plus-wifi_4.png	f	413	ASUS TUF Gaming B760-PLUS WiFi	gallery	4	\N	web
1453	product_images/msi-mag-b650-tomahawk-wifi_0.png	t	414	MSI MAG B650 TOMAHAWK WiFi	main	0	\N	web
1454	product_images/msi-mag-b650-tomahawk-wifi_1.png	f	414	MSI MAG B650 TOMAHAWK WiFi	gallery	1	\N	web
1455	product_images/msi-mag-b650-tomahawk-wifi_2.png	f	414	MSI MAG B650 TOMAHAWK WiFi	gallery	2	\N	web
1456	product_images/asrock-b650m-pro-rs-wifi_0.png	t	415	ASRock B650M Pro RS WiFi	main	0	\N	web
1457	product_images/asrock-b650m-pro-rs-wifi_1.png	f	415	ASRock B650M Pro RS WiFi	gallery	1	\N	web
1458	product_images/asrock-b650m-pro-rs-wifi_2.png	f	415	ASRock B650M Pro RS WiFi	gallery	2	\N	web
1459	product_images/msi-mpg-x670e-carbon-wifi_0.jpg	t	416	MSI MPG X670E Carbon WiFi	main	0	\N	web
1460	product_images/msi-mpg-x670e-carbon-wifi_2.jpg	f	416	MSI MPG X670E Carbon WiFi	gallery	2	\N	web
1461	product_images/msi-mpg-x670e-carbon-wifi_4.jpg	f	416	MSI MPG X670E Carbon WiFi	gallery	4	\N	web
1462	product_images/gigabyte-b550-aorus-elite-v2_0.png	t	417	Gigabyte B550 AORUS Elite V2	main	0	\N	web
1463	product_images/gigabyte-b550-aorus-elite-v2_1.png	f	417	Gigabyte B550 AORUS Elite V2	gallery	1	\N	web
1464	product_images/gigabyte-b550-aorus-elite-v2_2.png	f	417	Gigabyte B550 AORUS Elite V2	gallery	2	\N	web
1465	product_images/asus-rog-crosshair-x670e-hero_0.png	t	418	ASUS ROG Crosshair X670E Hero	main	0	\N	web
1466	product_images/asus-rog-crosshair-x670e-hero_2.jpg	f	418	ASUS ROG Crosshair X670E Hero	gallery	2	\N	web
1467	product_images/asus-rog-crosshair-x670e-hero_3.jpg	f	418	ASUS ROG Crosshair X670E Hero	gallery	3	\N	web
1468	product_images/kingston-fury-beast-ddr5-32gb-2x16-5600mhz_1.jpg	f	419	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz	gallery	1	\N	web
1469	product_images/kingston-fury-beast-ddr5-32gb-2x16-5600mhz_2.jpg	f	419	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz	gallery	2	\N	web
1470	product_images/kingston-fury-beast-ddr5-32gb-2x16-5600mhz_3.jpg	f	419	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz	gallery	3	\N	web
1471	product_images/corsair-vengeance-ddr5-32gb-2x16-6000mhz-rgb_0.jpg	t	420	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB	main	0	\N	web
1472	product_images/corsair-vengeance-ddr5-32gb-2x16-6000mhz-rgb_2.jpg	f	420	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB	gallery	2	\N	web
1473	product_images/corsair-vengeance-ddr5-32gb-2x16-6000mhz-rgb_3.jpg	f	420	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB	gallery	3	\N	web
1474	product_images/gskill-trident-z5-rgb-ddr5-32gb-2x16-6400mhz_0.jpg	t	421	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz	main	0	\N	web
1475	product_images/gskill-trident-z5-rgb-ddr5-32gb-2x16-6400mhz_2.webp	f	421	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz	gallery	2	\N	web
1476	product_images/gskill-trident-z5-rgb-ddr5-32gb-2x16-6400mhz_5.jpg	f	421	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz	gallery	5	\N	web
1477	product_images/crucial-pro-ddr5-32gb-2x16-5600mhz_2.jpg	f	422	Crucial Pro DDR5 32GB (2×16GB) 5600MHz	gallery	2	\N	web
1478	product_images/crucial-pro-ddr5-32gb-2x16-5600mhz_3.webp	f	422	Crucial Pro DDR5 32GB (2×16GB) 5600MHz	gallery	3	\N	web
1479	product_images/crucial-pro-ddr5-32gb-2x16-5600mhz_4.png	f	422	Crucial Pro DDR5 32GB (2×16GB) 5600MHz	gallery	4	\N	web
1480	product_images/crucial-pro-ddr4-32gb-2x16-3200mhz_0.jpg	t	423	Crucial Pro DDR4 32GB (2×16GB) 3200MHz	main	0	\N	web
1481	product_images/teamgroup-t-force-delta-rgb-ddr5-64gb-2x32-6000mhz_0.jpg	t	424	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz	main	0	\N	web
1482	product_images/teamgroup-t-force-delta-rgb-ddr5-64gb-2x32-6000mhz_1.jpg	f	424	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz	gallery	1	\N	web
1483	product_images/teamgroup-t-force-delta-rgb-ddr5-64gb-2x32-6000mhz_2.jpg	f	424	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz	gallery	2	\N	web
1484	product_images/patriot-viper-steel-ddr4-16gb-2x8-3600mhz_0.jpg	t	425	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz	main	0	\N	web
1485	product_images/patriot-viper-steel-ddr4-16gb-2x8-3600mhz_2.png	f	425	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz	gallery	2	\N	web
1486	product_images/patriot-viper-steel-ddr4-16gb-2x8-3600mhz_3.jpg	f	425	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz	gallery	3	\N	web
1487	product_images/kingston-fury-renegade-ddr5-32gb-2x16-7200mhz_1.webp	f	426	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz	gallery	1	\N	web
1488	product_images/kingston-fury-renegade-ddr5-32gb-2x16-7200mhz_3.jpg	f	426	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz	gallery	3	\N	web
1489	product_images/kingston-fury-renegade-ddr5-32gb-2x16-7200mhz_4.jpg	f	426	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz	gallery	4	\N	web
1490	product_images/samsung-990-pro-2tb-nvme-m2_0.jpg	t	427	Samsung 990 PRO 2TB NVMe M.2	main	0	\N	web
1491	product_images/samsung-990-pro-2tb-nvme-m2_1.jpg	f	427	Samsung 990 PRO 2TB NVMe M.2	gallery	1	\N	web
1492	product_images/samsung-990-pro-2tb-nvme-m2_3.jpg	f	427	Samsung 990 PRO 2TB NVMe M.2	gallery	3	\N	web
1493	product_images/wd-black-sn850x-1tb-nvme-m2_1.jpg	f	428	WD Black SN850X 1TB NVMe M.2	gallery	1	\N	web
1494	product_images/wd-black-sn850x-1tb-nvme-m2_3.jpg	f	428	WD Black SN850X 1TB NVMe M.2	gallery	3	\N	web
1495	product_images/wd-black-sn850x-1tb-nvme-m2_6.jpg	f	428	WD Black SN850X 1TB NVMe M.2	gallery	6	\N	web
1496	product_images/kingston-kc3000-2tb-nvme-m2_0.jpg	t	429	Kingston KC3000 2TB NVMe M.2	main	0	\N	web
1497	product_images/kingston-kc3000-2tb-nvme-m2_1.jpg	f	429	Kingston KC3000 2TB NVMe M.2	gallery	1	\N	web
1498	product_images/kingston-kc3000-2tb-nvme-m2_3.jpg	f	429	Kingston KC3000 2TB NVMe M.2	gallery	3	\N	web
1499	product_images/crucial-t700-1tb-nvme-m2-pcie-5_0.png	t	430	Crucial T700 1TB NVMe M.2 PCIe 5.0	main	0	\N	web
1500	product_images/crucial-t700-1tb-nvme-m2-pcie-5_2.jpg	f	430	Crucial T700 1TB NVMe M.2 PCIe 5.0	gallery	2	\N	web
1501	product_images/crucial-t700-1tb-nvme-m2-pcie-5_4.jpg	f	430	Crucial T700 1TB NVMe M.2 PCIe 5.0	gallery	4	\N	web
1502	product_images/samsung-870-evo-1tb-sata-25_2.jpg	f	431	Samsung 870 EVO 1TB SATA 2.5"	gallery	2	\N	web
1503	product_images/samsung-870-evo-1tb-sata-25_5.jpg	f	431	Samsung 870 EVO 1TB SATA 2.5"	gallery	5	\N	web
1504	product_images/wd-blue-sn580-1tb-nvme-m2_0.jpg	t	432	WD Blue SN580 1TB NVMe M.2	main	0	\N	web
1505	product_images/wd-blue-sn580-1tb-nvme-m2_2.jpg	f	432	WD Blue SN580 1TB NVMe M.2	gallery	2	\N	web
1506	product_images/wd-blue-sn580-1tb-nvme-m2_3.webp	f	432	WD Blue SN580 1TB NVMe M.2	gallery	3	\N	web
1507	product_images/seagate-barracuda-4tb-hdd-35_0.jpg	t	433	Seagate BarraCuda 4TB HDD 3.5"	main	0	\N	web
1508	product_images/seagate-barracuda-4tb-hdd-35_1.jpg	f	433	Seagate BarraCuda 4TB HDD 3.5"	gallery	1	\N	web
1509	product_images/seagate-barracuda-4tb-hdd-35_3.jpg	f	433	Seagate BarraCuda 4TB HDD 3.5"	gallery	3	\N	web
1510	product_images/wd-red-plus-8tb-nas-hdd-35_0.png	t	434	WD Red Plus 8TB NAS HDD 3.5"	main	0	\N	web
1511	product_images/wd-red-plus-8tb-nas-hdd-35_2.jpg	f	434	WD Red Plus 8TB NAS HDD 3.5"	gallery	2	\N	web
1512	product_images/wd-red-plus-8tb-nas-hdd-35_4.png	f	434	WD Red Plus 8TB NAS HDD 3.5"	gallery	4	\N	web
1513	product_images/toshiba-n300-12tb-nas-hdd-35_0.jpg	t	435	Toshiba N300 12TB NAS HDD 3.5"	main	0	\N	web
1514	product_images/toshiba-n300-12tb-nas-hdd-35_2.jpg	f	435	Toshiba N300 12TB NAS HDD 3.5"	gallery	2	\N	web
1515	product_images/toshiba-n300-12tb-nas-hdd-35_3.jpg	f	435	Toshiba N300 12TB NAS HDD 3.5"	gallery	3	\N	web
1516	product_images/seagate-ironwolf-4tb-nas-hdd-35_0.jpg	t	436	Seagate IronWolf 4TB NAS HDD 3.5"	main	0	\N	web
1517	product_images/seagate-ironwolf-4tb-nas-hdd-35_1.jpg	f	436	Seagate IronWolf 4TB NAS HDD 3.5"	gallery	1	\N	web
1518	product_images/seagate-ironwolf-4tb-nas-hdd-35_2.jpg	f	436	Seagate IronWolf 4TB NAS HDD 3.5"	gallery	2	\N	web
1519	product_images/corsair-rm850x-2024-850w-80plus-gold_0.jpg	t	437	Corsair RM850x (2024) 850W 80+ Gold	main	0	\N	web
1520	product_images/corsair-rm850x-2024-850w-80plus-gold_2.jpg	f	437	Corsair RM850x (2024) 850W 80+ Gold	gallery	2	\N	web
1521	product_images/corsair-rm850x-2024-850w-80plus-gold_3.jpg	f	437	Corsair RM850x (2024) 850W 80+ Gold	gallery	3	\N	web
1522	product_images/be-quiet-dark-power-13-1000w-80plus-titanium_0.jpg	t	438	be quiet! Dark Power 13 1000W 80+ Titanium	main	0	\N	web
1523	product_images/be-quiet-dark-power-13-1000w-80plus-titanium_1.jpg	f	438	be quiet! Dark Power 13 1000W 80+ Titanium	gallery	1	\N	web
1524	product_images/be-quiet-dark-power-13-1000w-80plus-titanium_2.jpg	f	438	be quiet! Dark Power 13 1000W 80+ Titanium	gallery	2	\N	web
1525	product_images/seasonic-focus-gx-750-750w-80plus-gold_1.jpg	f	439	Seasonic Focus GX-750 750W 80+ Gold	gallery	1	\N	web
1526	product_images/seasonic-focus-gx-750-750w-80plus-gold_2.jpg	f	439	Seasonic Focus GX-750 750W 80+ Gold	gallery	2	\N	web
1527	product_images/seasonic-focus-gx-750-750w-80plus-gold_3.jpg	f	439	Seasonic Focus GX-750 750W 80+ Gold	gallery	3	\N	web
1528	product_images/cooler-master-mwe-gold-650-v2-650w-80plus-gold_0.jpg	t	440	Cooler Master MWE Gold 650 V2 650W 80+ Gold	main	0	\N	web
1529	product_images/cooler-master-mwe-gold-650-v2-650w-80plus-gold_1.jpg	f	440	Cooler Master MWE Gold 650 V2 650W 80+ Gold	gallery	1	\N	web
1530	product_images/cooler-master-mwe-gold-650-v2-650w-80plus-gold_3.jpg	f	440	Cooler Master MWE Gold 650 V2 650W 80+ Gold	gallery	3	\N	web
1531	product_images/evga-supernova-850-gt-850w-80plus-gold_0.png	t	441	EVGA SuperNOVA 850 GT 850W 80+ Gold	main	0	\N	web
1532	product_images/evga-supernova-850-gt-850w-80plus-gold_1.jpg	f	441	EVGA SuperNOVA 850 GT 850W 80+ Gold	gallery	1	\N	web
1533	product_images/evga-supernova-850-gt-850w-80plus-gold_2.jpg	f	441	EVGA SuperNOVA 850 GT 850W 80+ Gold	gallery	2	\N	web
1534	product_images/corsair-rm750e-750w-80plus-gold_0.png	t	442	Corsair RM750e 750W 80+ Gold	main	0	\N	web
1535	product_images/corsair-rm750e-750w-80plus-gold_3.jpg	f	442	Corsair RM750e 750W 80+ Gold	gallery	3	\N	web
1536	product_images/corsair-rm750e-750w-80plus-gold_4.jpg	f	442	Corsair RM750e 750W 80+ Gold	gallery	4	\N	web
1537	product_images/deepcool-pq1000m-1000w-80plus-gold_0.jpg	t	443	DeepCool PQ1000M 1000W 80+ Gold	main	0	\N	web
1538	product_images/deepcool-pq1000m-1000w-80plus-gold_4.jpg	f	443	DeepCool PQ1000M 1000W 80+ Gold	gallery	4	\N	web
1539	product_images/deepcool-pq1000m-1000w-80plus-gold_5.jpg	f	443	DeepCool PQ1000M 1000W 80+ Gold	gallery	5	\N	web
1540	product_images/be-quiet-pure-power-12-m-750w-80plus-gold_0.jpg	t	444	be quiet! Pure Power 12 M 750W 80+ Gold	main	0	\N	web
1541	product_images/be-quiet-pure-power-12-m-750w-80plus-gold_1.jpg	f	444	be quiet! Pure Power 12 M 750W 80+ Gold	gallery	1	\N	web
1542	product_images/be-quiet-pure-power-12-m-750w-80plus-gold_2.jpg	f	444	be quiet! Pure Power 12 M 750W 80+ Gold	gallery	2	\N	web
1543	product_images/cooler-master-masterbox-td500-mesh-v2_0.jpg	t	445	Cooler Master MasterBox TD500 Mesh V2	main	0	\N	web
1544	product_images/cooler-master-masterbox-td500-mesh-v2_1.png	f	445	Cooler Master MasterBox TD500 Mesh V2	gallery	1	\N	web
1545	product_images/cooler-master-masterbox-td500-mesh-v2_3.jpg	f	445	Cooler Master MasterBox TD500 Mesh V2	gallery	3	\N	web
1546	product_images/fractal-design-north-charcoal-black_0.png	t	446	Fractal Design North Charcoal Black	main	0	\N	web
1547	product_images/fractal-design-north-charcoal-black_1.jpg	f	446	Fractal Design North Charcoal Black	gallery	1	\N	web
1548	product_images/fractal-design-north-charcoal-black_2.png	f	446	Fractal Design North Charcoal Black	gallery	2	\N	web
1549	product_images/nzxt-h7-flow_0.png	t	447	NZXT H7 Flow	main	0	\N	web
1550	product_images/nzxt-h7-flow_2.png	f	447	NZXT H7 Flow	gallery	2	\N	web
1551	product_images/nzxt-h7-flow_3.jpg	f	447	NZXT H7 Flow	gallery	3	\N	web
1552	product_images/corsair-4000d-airflow_0.jpg	t	448	Corsair 4000D Airflow	main	0	\N	web
1553	product_images/corsair-4000d-airflow_1.jpg	f	448	Corsair 4000D Airflow	gallery	1	\N	web
1554	product_images/corsair-4000d-airflow_3.png	f	448	Corsair 4000D Airflow	gallery	3	\N	web
1555	product_images/lian-li-o11-dynamic-evo_0.jpg	t	449	Lian Li O11 Dynamic EVO	main	0	\N	web
1556	product_images/lian-li-o11-dynamic-evo_1.webp	f	449	Lian Li O11 Dynamic EVO	gallery	1	\N	web
1557	product_images/lian-li-o11-dynamic-evo_2.jpg	f	449	Lian Li O11 Dynamic EVO	gallery	2	\N	web
1558	product_images/be-quiet-silent-base-802_1.jpg	f	450	be quiet! Silent Base 802	gallery	1	\N	web
1559	product_images/be-quiet-silent-base-802_2.jpg	f	450	be quiet! Silent Base 802	gallery	2	\N	web
1560	product_images/be-quiet-silent-base-802_3.jpg	f	450	be quiet! Silent Base 802	gallery	3	\N	web
1561	product_images/noctua-nh-d15-chromax-black_0.jpg	t	451	Noctua NH-D15 chromax.black	main	0	\N	web
1562	product_images/noctua-nh-d15-chromax-black_1.jpg	f	451	Noctua NH-D15 chromax.black	gallery	1	\N	web
1563	product_images/noctua-nh-d15-chromax-black_3.jpg	f	451	Noctua NH-D15 chromax.black	gallery	3	\N	web
1564	product_images/deepcool-ak620_0.jpg	t	452	DeepCool AK620	main	0	\N	web
1565	product_images/deepcool-ak620_1.webp	f	452	DeepCool AK620	gallery	1	\N	web
1566	product_images/deepcool-ak620_2.jpg	f	452	DeepCool AK620	gallery	2	\N	web
1567	product_images/be-quiet-dark-rock-pro-4_0.jpg	t	453	be quiet! Dark Rock Pro 4	main	0	\N	web
1568	product_images/be-quiet-dark-rock-pro-4_2.jpg	f	453	be quiet! Dark Rock Pro 4	gallery	2	\N	web
1569	product_images/be-quiet-dark-rock-pro-4_3.png	f	453	be quiet! Dark Rock Pro 4	gallery	3	\N	web
1570	product_images/arctic-liquid-freezer-ii-360_0.webp	t	454	Arctic Liquid Freezer II 360	main	0	\N	web
1571	product_images/arctic-liquid-freezer-ii-360_1.png	f	454	Arctic Liquid Freezer II 360	gallery	1	\N	web
1572	product_images/arctic-liquid-freezer-ii-360_2.jpg	f	454	Arctic Liquid Freezer II 360	gallery	2	\N	web
1573	product_images/corsair-icue-h150i-elite-lcd-xt_0.jpg	t	455	Corsair iCUE H150i Elite LCD XT	main	0	\N	web
1574	product_images/corsair-icue-h150i-elite-lcd-xt_2.jpg	f	455	Corsair iCUE H150i Elite LCD XT	gallery	2	\N	web
1575	product_images/corsair-icue-h150i-elite-lcd-xt_3.png	f	455	Corsair iCUE H150i Elite LCD XT	gallery	3	\N	web
1576	product_images/cooler-master-hyper-212-halo-black_0.webp	t	456	Cooler Master Hyper 212 Halo Black	main	0	\N	web
1577	product_images/cooler-master-hyper-212-halo-black_1.jpg	f	456	Cooler Master Hyper 212 Halo Black	gallery	1	\N	web
1578	product_images/cooler-master-hyper-212-halo-black_3.jpg	f	456	Cooler Master Hyper 212 Halo Black	gallery	3	\N	web
1579	product_images/nzxt-kraken-x63-rgb-280mm_2.jpg	f	457	NZXT Kraken X63 RGB 280mm	gallery	2	\N	web
1580	product_images/nzxt-kraken-x63-rgb-280mm_4.png	f	457	NZXT Kraken X63 RGB 280mm	gallery	4	\N	web
1581	product_images/nzxt-kraken-x63-rgb-280mm_5.jpg	f	457	NZXT Kraken X63 RGB 280mm	gallery	5	\N	web
1582	product_images/thermalright-peerless-assassin-120-se_2.jpg	f	458	Thermalright Peerless Assassin 120 SE	gallery	2	\N	web
1583	product_images/thermalright-peerless-assassin-120-se_4.jpg	f	458	Thermalright Peerless Assassin 120 SE	gallery	4	\N	web
1584	product_images/thermalright-peerless-assassin-120-se_5.jpg	f	458	Thermalright Peerless Assassin 120 SE	gallery	5	\N	web
1585	product_images/samsung-odyssey-g7-27-qhd-240hz-curved_2.jpg	f	459	Samsung Odyssey G7 27" QHD 240Hz Curved	gallery	2	\N	web
1586	product_images/samsung-odyssey-g7-27-qhd-240hz-curved_3.jpg	f	459	Samsung Odyssey G7 27" QHD 240Hz Curved	gallery	3	\N	web
1587	product_images/samsung-odyssey-g7-27-qhd-240hz-curved_4.jpg	f	459	Samsung Odyssey G7 27" QHD 240Hz Curved	gallery	4	\N	web
1588	product_images/lg-ultragear-27gp850-b-27-qhd-165hz-nano-ips_0.jpg	t	460	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS	main	0	\N	web
1589	product_images/lg-ultragear-27gp850-b-27-qhd-165hz-nano-ips_2.jpg	f	460	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS	gallery	2	\N	web
1590	product_images/lg-ultragear-27gp850-b-27-qhd-165hz-nano-ips_4.jpg	f	460	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS	gallery	4	\N	web
1591	product_images/asus-rog-swift-pg32ucdm-32-4k-240hz-oled_0.webp	t	461	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED	main	0	\N	web
1592	product_images/asus-rog-swift-pg32ucdm-32-4k-240hz-oled_1.jpg	f	461	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED	gallery	1	\N	web
1593	product_images/asus-rog-swift-pg32ucdm-32-4k-240hz-oled_2.png	f	461	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED	gallery	2	\N	web
1594	product_images/dell-s2722qc-27-4k-60hz-ips_0.webp	t	462	Dell S2722QC 27" 4K 60Hz IPS	main	0	\N	web
1595	product_images/dell-s2722qc-27-4k-60hz-ips_1.jpg	f	462	Dell S2722QC 27" 4K 60Hz IPS	gallery	1	\N	web
1596	product_images/dell-s2722qc-27-4k-60hz-ips_2.jpg	f	462	Dell S2722QC 27" 4K 60Hz IPS	gallery	2	\N	web
1597	product_images/gigabyte-m27q-27-qhd-170hz-ips_0.jpg	t	463	Gigabyte M27Q 27" QHD 170Hz IPS	main	0	\N	web
1598	product_images/gigabyte-m27q-27-qhd-170hz-ips_5.jpg	f	463	Gigabyte M27Q 27" QHD 170Hz IPS	gallery	5	\N	web
1599	product_images/gigabyte-m27q-27-qhd-170hz-ips_7.jpg	f	463	Gigabyte M27Q 27" QHD 170Hz IPS	gallery	7	\N	web
1600	product_images/benq-pd2705u-27-4k-60hz-ips-designer_1.jpg	f	464	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor	gallery	1	\N	web
1601	product_images/benq-pd2705u-27-4k-60hz-ips-designer_4.jpg	f	464	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor	gallery	4	\N	web
1602	product_images/benq-pd2705u-27-4k-60hz-ips-designer_6.jpg	f	464	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor	gallery	6	\N	web
1603	product_images/asus-proart-pa278qv-27-qhd-75hz-ips_0.webp	t	465	ASUS ProArt PA278QV 27" QHD 75Hz IPS	main	0	\N	web
1604	product_images/asus-proart-pa278qv-27-qhd-75hz-ips_1.webp	f	465	ASUS ProArt PA278QV 27" QHD 75Hz IPS	gallery	1	\N	web
1605	product_images/asus-proart-pa278qv-27-qhd-75hz-ips_3.jpg	f	465	ASUS ProArt PA278QV 27" QHD 75Hz IPS	gallery	3	\N	web
1606	product_images/asus-rog-zephyrus-g16-2025-ultra9-rtx4070_0.jpg	t	467	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070	main	0	\N	web
1607	product_images/asus-rog-zephyrus-g16-2025-ultra9-rtx4070_3.png	f	467	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070	gallery	3	\N	web
1608	product_images/asus-rog-zephyrus-g16-2025-ultra9-rtx4070_4.jpg	f	467	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070	gallery	4	\N	web
1609	product_images/lenovo-legion-pro-5-16irx9-i9-rtx4060_0.jpg	t	468	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060	main	0	\N	web
1610	product_images/lenovo-legion-pro-5-16irx9-i9-rtx4060_1.jpg	f	468	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060	gallery	1	\N	web
1611	product_images/lenovo-legion-pro-5-16irx9-i9-rtx4060_2.jpg	f	468	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060	gallery	2	\N	web
1612	product_images/acer-predator-helios-16-i7-rtx4070_0.jpg	t	469	Acer Predator Helios 16 16" i7 / RTX 4070	main	0	\N	web
1613	product_images/acer-predator-helios-16-i7-rtx4070_2.jpg	f	469	Acer Predator Helios 16 16" i7 / RTX 4070	gallery	2	\N	web
1614	product_images/acer-predator-helios-16-i7-rtx4070_3.jpg	f	469	Acer Predator Helios 16 16" i7 / RTX 4070	gallery	3	\N	web
1615	product_images/apple-macbook-pro-16-m4-pro_0.jpg	t	470	Apple MacBook Pro 16" M4 Pro	main	0	\N	web
1616	product_images/apple-macbook-pro-16-m4-pro_1.jpg	f	470	Apple MacBook Pro 16" M4 Pro	gallery	1	\N	web
1617	product_images/apple-macbook-pro-16-m4-pro_2.jpg	f	470	Apple MacBook Pro 16" M4 Pro	gallery	2	\N	web
1618	product_images/apple-macbook-air-15-m4_0.jpg	t	471	Apple MacBook Air 15" M4	main	0	\N	web
1619	product_images/apple-macbook-air-15-m4_1.jpg	f	471	Apple MacBook Air 15" M4	gallery	1	\N	web
1620	product_images/apple-macbook-air-15-m4_2.jpg	f	471	Apple MacBook Air 15" M4	gallery	2	\N	web
1621	product_images/dell-xps-15-9530-i7-rtx4060_0.jpg	t	472	Dell XPS 15 9530 15.6" i7 / RTX 4060	main	0	\N	web
1622	product_images/dell-xps-15-9530-i7-rtx4060_1.png	f	472	Dell XPS 15 9530 15.6" i7 / RTX 4060	gallery	1	\N	web
1623	product_images/dell-xps-15-9530-i7-rtx4060_2.jpg	f	472	Dell XPS 15 9530 15.6" i7 / RTX 4060	gallery	2	\N	web
1624	product_images/hp-spectre-x360-16-ultra7-intel-arc_0.jpg	t	473	HP Spectre x360 16" Ultra 7 / Intel Arc	main	0	\N	web
1625	product_images/hp-spectre-x360-16-ultra7-intel-arc_2.jpg	f	473	HP Spectre x360 16" Ultra 7 / Intel Arc	gallery	2	\N	web
1626	product_images/hp-spectre-x360-16-ultra7-intel-arc_3.jpg	f	473	HP Spectre x360 16" Ultra 7 / Intel Arc	gallery	3	\N	web
1627	product_images/lenovo-thinkpad-x1-carbon-gen12-ultra7_0.jpg	t	474	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7	main	0	\N	web
1628	product_images/lenovo-thinkpad-x1-carbon-gen12-ultra7_1.jpg	f	474	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7	gallery	1	\N	web
1629	product_images/lenovo-thinkpad-x1-carbon-gen12-ultra7_2.jpg	f	474	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7	gallery	2	\N	web
1630	product_images/logitech-g-pro-x-superlight-2_0.png	t	475	Logitech G Pro X Superlight 2	main	0	\N	web
1631	product_images/logitech-g-pro-x-superlight-2_1.jpg	f	475	Logitech G Pro X Superlight 2	gallery	1	\N	web
1632	product_images/logitech-g-pro-x-superlight-2_2.png	f	475	Logitech G Pro X Superlight 2	gallery	2	\N	web
1633	product_images/razer-deathadder-v3-pro_0.jpg	t	476	Razer DeathAdder V3 Pro	main	0	\N	web
1634	product_images/razer-deathadder-v3-pro_1.png	f	476	Razer DeathAdder V3 Pro	gallery	1	\N	web
1635	product_images/razer-deathadder-v3-pro_3.jpg	f	476	Razer DeathAdder V3 Pro	gallery	3	\N	web
1636	product_images/logitech-g502-x-plus_0.png	t	477	Logitech G502 X Plus	main	0	\N	web
1637	product_images/logitech-g502-x-plus_1.jpg	f	477	Logitech G502 X Plus	gallery	1	\N	web
1638	product_images/logitech-g502-x-plus_2.jpg	f	477	Logitech G502 X Plus	gallery	2	\N	web
1639	product_images/razer-basilisk-v3-pro_0.jpg	t	478	Razer Basilisk V3 Pro	main	0	\N	web
1640	product_images/razer-basilisk-v3-pro_1.jpg	f	478	Razer Basilisk V3 Pro	gallery	1	\N	web
1641	product_images/razer-basilisk-v3-pro_3.jpg	f	478	Razer Basilisk V3 Pro	gallery	3	\N	web
1642	product_images/steelseries-rival-5_0.jpg	t	479	SteelSeries Rival 5	main	0	\N	web
1643	product_images/steelseries-rival-5_1.png	f	479	SteelSeries Rival 5	gallery	1	\N	web
1644	product_images/steelseries-rival-5_2.jpg	f	479	SteelSeries Rival 5	gallery	2	\N	web
1645	product_images/zowie-ec2-c_1.jpg	f	480	Zowie EC2-C	gallery	1	\N	web
1646	product_images/zowie-ec2-c_2.jpg	f	480	Zowie EC2-C	gallery	2	\N	web
1647	product_images/zowie-ec2-c_3.png	f	480	Zowie EC2-C	gallery	3	\N	web
1648	product_images/steelseries-apex-pro-tkl-2025-wireless_0.webp	t	481	SteelSeries Apex Pro TKL (2025) Wireless	main	0	\N	web
1649	product_images/steelseries-apex-pro-tkl-2025-wireless_1.png	f	481	SteelSeries Apex Pro TKL (2025) Wireless	gallery	1	\N	web
1650	product_images/steelseries-apex-pro-tkl-2025-wireless_3.jpg	f	481	SteelSeries Apex Pro TKL (2025) Wireless	gallery	3	\N	web
1651	product_images/razer-blackwidow-v4-pro_0.webp	t	482	Razer BlackWidow V4 Pro	main	0	\N	web
1652	product_images/razer-blackwidow-v4-pro_1.jpg	f	482	Razer BlackWidow V4 Pro	gallery	1	\N	web
1653	product_images/razer-blackwidow-v4-pro_2.jpg	f	482	Razer BlackWidow V4 Pro	gallery	2	\N	web
1654	product_images/logitech-g915-tkl-wireless_0.jpg	t	483	Logitech G915 TKL Wireless	main	0	\N	web
1655	product_images/logitech-g915-tkl-wireless_1.jpg	f	483	Logitech G915 TKL Wireless	gallery	1	\N	web
1656	product_images/logitech-g915-tkl-wireless_2.jpg	f	483	Logitech G915 TKL Wireless	gallery	2	\N	web
1657	product_images/keychron-q1-pro-qmk-via-wireless_0.jpg	t	484	Keychron Q1 Pro QMK/VIA Wireless	main	0	\N	web
1658	product_images/keychron-q1-pro-qmk-via-wireless_1.jpg	f	484	Keychron Q1 Pro QMK/VIA Wireless	gallery	1	\N	web
1659	product_images/keychron-q1-pro-qmk-via-wireless_2.jpg	f	484	Keychron Q1 Pro QMK/VIA Wireless	gallery	2	\N	web
1660	product_images/ducky-one-3-classic-tkl_0.jpg	t	485	Ducky One 3 Classic TKL	main	0	\N	web
1661	product_images/ducky-one-3-classic-tkl_1.webp	f	485	Ducky One 3 Classic TKL	gallery	1	\N	web
1662	product_images/ducky-one-3-classic-tkl_3.webp	f	485	Ducky One 3 Classic TKL	gallery	3	\N	web
1663	product_images/corsair-k70-rgb-pro_0.jpg	t	486	Corsair K70 RGB Pro	main	0	\N	web
1664	product_images/corsair-k70-rgb-pro_2.jpg	f	486	Corsair K70 RGB Pro	gallery	2	\N	web
1665	product_images/corsair-k70-rgb-pro_3.jpg	f	486	Corsair K70 RGB Pro	gallery	3	\N	web
1666	product_images/hyperx-cloud-iii-wireless_0.jpg	t	487	HyperX Cloud III Wireless	main	0	\N	web
1667	product_images/hyperx-cloud-iii-wireless_1.jpg	f	487	HyperX Cloud III Wireless	gallery	1	\N	web
1668	product_images/hyperx-cloud-iii-wireless_3.jpg	f	487	HyperX Cloud III Wireless	gallery	3	\N	web
1669	product_images/steelseries-arctis-nova-pro-wireless_0.png	t	488	SteelSeries Arctis Nova Pro Wireless	main	0	\N	web
1670	product_images/steelseries-arctis-nova-pro-wireless_1.jpg	f	488	SteelSeries Arctis Nova Pro Wireless	gallery	1	\N	web
1671	product_images/steelseries-arctis-nova-pro-wireless_2.jpg	f	488	SteelSeries Arctis Nova Pro Wireless	gallery	2	\N	web
1672	product_images/razer-blackshark-v2-pro-2024_0.png	t	489	Razer BlackShark V2 Pro (2024)	main	0	\N	web
1673	product_images/razer-blackshark-v2-pro-2024_1.jpg	f	489	Razer BlackShark V2 Pro (2024)	gallery	1	\N	web
1674	product_images/razer-blackshark-v2-pro-2024_3.jpg	f	489	Razer BlackShark V2 Pro (2024)	gallery	3	\N	web
1675	product_images/logitech-g-pro-x-2-lightspeed_0.jpg	t	490	Logitech G Pro X 2 Lightspeed	main	0	\N	web
1676	product_images/logitech-g-pro-x-2-lightspeed_1.jpg	f	490	Logitech G Pro X 2 Lightspeed	gallery	1	\N	web
1677	product_images/logitech-g-pro-x-2-lightspeed_3.png	f	490	Logitech G Pro X 2 Lightspeed	gallery	3	\N	web
1678	product_images/kovrik-a4tech-bloody-b-080s-professional-x-thin-gaming-mouse-pad-430x_1.jpg	f	681	Коврик A4TECH BLOODY B-080S PROFESSIONAL X-THIN GAMING MOUSE PAD (430x	gallery	1	\N	web
1679	product_images/kovrik-a4tech-bloody-b-080s-professional-x-thin-gaming-mouse-pad-430x_5.jpg	f	681	Коврик A4TECH BLOODY B-080S PROFESSIONAL X-THIN GAMING MOUSE PAD (430x	gallery	5	\N	web
1680	product_images/ups-svc-600va-l_1.jpg	f	802	UPS SVC 600VA - L	gallery	1	\N	web
1681	product_images/mouse-defender-monstro-gm-510l-optika6knopok3200dpi-igrovaya_2.jpg	f	664	Mouse Defender Monstro GM-510L оптика,6кнопок,3200dpi игровая	gallery	2	\N	web
1682	product_images/mouse-defender-monstro-gm-510l-optika6knopok3200dpi-igrovaya_4.jpg	f	664	Mouse Defender Monstro GM-510L оптика,6кнопок,3200dpi игровая	gallery	4	\N	web
1683	product_images/besprovodnoy-komplekt-a4tech-9300f-gr-152g9-730fx-v-track_1.jpg	f	601	Беспроводной комплект A4TECH 9300F (GR-152+G9-730FX) V-TRACK	gallery	1	\N	web
1684	product_images/besprovodnoy-komplekt-a4tech-9300f-gr-152g9-730fx-v-track_3.jpg	f	601	Беспроводной комплект A4TECH 9300F (GR-152+G9-730FX) V-TRACK	gallery	3	\N	web
1685	product_images/besprovodnoy-komplekt-a4tech-9300f-gr-152g9-730fx-v-track_5.jpg	f	601	Беспроводной комплект A4TECH 9300F (GR-152+G9-730FX) V-TRACK	gallery	5	\N	web
1686	product_images/a4tech-fstyler-fg16-optical-mouse-wireless-1200dpi-black_0.jpg	t	647	A4TECH FSTYLER FG16 OPTICAL MOUSE WIRELESS 1200DPI BLACK	main	0	\N	web
1687	product_images/a4tech-fstyler-fg16-optical-mouse-wireless-1200dpi-black_2.jpg	f	647	A4TECH FSTYLER FG16 OPTICAL MOUSE WIRELESS 1200DPI BLACK	gallery	2	\N	web
1688	product_images/a4tech-fstyler-fg16-optical-mouse-wireless-1200dpi-black_3.jpg	f	647	A4TECH FSTYLER FG16 OPTICAL MOUSE WIRELESS 1200DPI BLACK	gallery	3	\N	web
1689	product_images/konverter-display-port-to-hdmi_0.jpg	t	497	конвертер Display Port to HDMI	main	0	\N	web
1690	product_images/konverter-display-port-to-hdmi_2.jpg	f	497	конвертер Display Port to HDMI	gallery	2	\N	web
1691	product_images/konverter-display-port-to-hdmi_4.jpg	f	497	конвертер Display Port to HDMI	gallery	4	\N	web
1692	product_images/vneshniy-adapter-dlya-nakopitelya-ugreen-cm257-usb30-sata-2535_1.jpg	f	496	Внешний адаптер для накопителя UGREEN CM257 (USB3.0 - SATA 2.5\\3.5)	gallery	1	\N	web
1693	product_images/vneshniy-adapter-dlya-nakopitelya-ugreen-cm257-usb30-sata-2535_3.jpg	f	496	Внешний адаптер для накопителя UGREEN CM257 (USB3.0 - SATA 2.5\\3.5)	gallery	3	\N	web
1694	product_images/monitor-lcd-27-aoc-c27g4zxe-curved-280hz_0.jpg	t	630	Монитор LCD 27" AOC C27G4ZXE, Curved, 280Hz	main	0	\N	web
1695	product_images/monitor-lcd-27-aoc-c27g4zxe-curved-280hz_1.jpg	f	630	Монитор LCD 27" AOC C27G4ZXE, Curved, 280Hz	gallery	1	\N	web
1696	product_images/monitor-lcd-27-aoc-c27g4zxe-curved-280hz_2.jpg	f	630	Монитор LCD 27" AOC C27G4ZXE, Curved, 280Hz	gallery	2	\N	web
1733	product_images/ddr4-8gb-pc-21333-hikvisiondahua_2.jpg	f	620	DDR4 8GB PC-21333 - Hikvision\\Dahua	gallery	2	\N	web
1697	product_images/mouse-defender-shock-gm-110l-optika6knopok800-3200-igrovaya-kovrik_0.png	t	665	Mouse Defender Shock GM-110L оптика,6кнопок,800-3200 игровая +коврик	main	0	\N	web
1698	product_images/mouse-defender-shock-gm-110l-optika6knopok800-3200-igrovaya-kovrik_2.png	f	665	Mouse Defender Shock GM-110L оптика,6кнопок,800-3200 игровая +коврик	gallery	2	\N	web
1699	product_images/mouse-defender-shock-gm-110l-optika6knopok800-3200-igrovaya-kovrik_5.jpg	f	665	Mouse Defender Shock GM-110L оптика,6кнопок,800-3200 игровая +коврик	gallery	5	\N	web
1700	product_images/klaviatura-x-gamexk-200ub-ultratonkaya-usb-angruskaz-chyornyy_0.jpg	t	606	Клавиатура, X-Game,XK-200UB Ультратонкая, USB, Анг/Рус/Каз, Чёрный	main	0	\N	web
1701	product_images/klaviatura-x-gamexk-200ub-ultratonkaya-usb-angruskaz-chyornyy_1.jpg	f	606	Клавиатура, X-Game,XK-200UB Ультратонкая, USB, Анг/Рус/Каз, Чёрный	gallery	1	\N	web
1702	product_images/klaviatura-x-gamexk-200ub-ultratonkaya-usb-angruskaz-chyornyy_2.jpg	f	606	Клавиатура, X-Game,XK-200UB Ультратонкая, USB, Анг/Рус/Каз, Чёрный	gallery	2	\N	web
1703	product_images/ssd-hikvision-hs-ssd-c100-120gb-tlc-25-sataiii_2.jpg	f	577	SSD HIKVISION HS-SSD-C100 120GB TLC 2,5"" SATAIII	gallery	2	\N	web
1704	product_images/ssd-hikvision-hs-ssd-c100-120gb-tlc-25-sataiii_3.jpg	f	577	SSD HIKVISION HS-SSD-C100 120GB TLC 2,5"" SATAIII	gallery	3	\N	web
1705	product_images/ssd-hikvision-hs-ssd-c100-120gb-tlc-25-sataiii_4.jpg	f	577	SSD HIKVISION HS-SSD-C100 120GB TLC 2,5"" SATAIII	gallery	4	\N	web
1706	product_images/ryukzak-dlya-noutbuka-lenovo-156-laptop-everyday-backpack-b510_1.jpg	f	850	Рюкзак для ноутбука Lenovo 15.6'' Laptop Everyday Backpack B510	gallery	1	\N	web
1707	product_images/ryukzak-dlya-noutbuka-lenovo-156-laptop-everyday-backpack-b510_2.jpg	f	850	Рюкзак для ноутбука Lenovo 15.6'' Laptop Everyday Backpack B510	gallery	2	\N	web
1708	product_images/ryukzak-dlya-noutbuka-lenovo-156-laptop-everyday-backpack-b510_3.jpg	f	850	Рюкзак для ноутбука Lenovo 15.6'' Laptop Everyday Backpack B510	gallery	3	\N	web
1709	product_images/ups-awp-aid850-850va-162v-295v-avr-12v8ah_1.jpg	f	801	UPS AWP AID850 850VA 162V-295V AVR 12V/8ah	gallery	1	\N	web
1710	product_images/ups-awp-aid850-850va-162v-295v-avr-12v8ah_2.jpg	f	801	UPS AWP AID850 850VA 162V-295V AVR 12V/8ah	gallery	2	\N	web
1711	product_images/ups-awp-aid850-850va-162v-295v-avr-12v8ah_3.jpg	f	801	UPS AWP AID850 850VA 162V-295V AVR 12V/8ah	gallery	3	\N	web
1712	product_images/keyboard-winstar-razeak-rk-8778-gaming-color-led-rus-usb_0.jpg	t	599	Keyboard Winstar Razeak RK-8778 GAMING COLOR LED RUS USB	main	0	\N	web
1713	product_images/keyboard-winstar-razeak-rk-8778-gaming-color-led-rus-usb_1.jpg	f	599	Keyboard Winstar Razeak RK-8778 GAMING COLOR LED RUS USB	gallery	1	\N	web
1714	product_images/keyboard-winstar-razeak-rk-8778-gaming-color-led-rus-usb_3.jpg	f	599	Keyboard Winstar Razeak RK-8778 GAMING COLOR LED RUS USB	gallery	3	\N	web
1715	product_images/cpu-cooler-deepcool-alta-9-775-soketa_0.jpg	t	550	CPU cooler DEEPCOOL ALTA-9 - 775 сокета	main	0	\N	web
1716	product_images/cpu-cooler-deepcool-alta-9-775-soketa_1.jpg	f	550	CPU cooler DEEPCOOL ALTA-9 - 775 сокета	gallery	1	\N	web
1717	product_images/cpu-cooler-deepcool-alta-9-775-soketa_5.jpg	f	550	CPU cooler DEEPCOOL ALTA-9 - 775 сокета	gallery	5	\N	web
1718	product_images/sumka-dlya-noutbuka-hp-value-k0b38aa-seraya-156-vodoottalkivayuschaya-tkan_1.webp	f	856	Сумка для ноутбука HP Value K0B38AA Серая 15.6" Водоотталкивающая ткан	gallery	1	\N	web
1719	product_images/sumka-dlya-noutbuka-hp-value-k0b38aa-seraya-156-vodoottalkivayuschaya-tkan_2.jpg	f	856	Сумка для ноутбука HP Value K0B38AA Серая 15.6" Водоотталкивающая ткан	gallery	2	\N	web
1720	product_images/sumka-dlya-noutbuka-hp-value-k0b38aa-seraya-156-vodoottalkivayuschaya-tkan_6.webp	f	856	Сумка для ноутбука HP Value K0B38AA Серая 15.6" Водоотталкивающая ткан	gallery	6	\N	web
1721	product_images/akkamulyator-dlya-ups-12v-7a-matrixdelta_1.jpg	f	807	Аккамулятор для UPS 12V \\ 7A Matrix\\Delta	gallery	1	\N	web
1722	product_images/akkamulyator-dlya-ups-12v-7a-matrixdelta_2.jpg	f	807	Аккамулятор для UPS 12V \\ 7A Matrix\\Delta	gallery	2	\N	web
1723	product_images/akkamulyator-dlya-ups-12v-7a-matrixdelta_4.jpg	f	807	Аккамулятор для UPS 12V \\ 7A Matrix\\Delta	gallery	4	\N	web
1724	product_images/power-unit-delux-dlp-30d-420w360a204pin2sata3big-4pin1small-4_0.jpg	t	756	Power Unit DELUX DLP-30D 420W(360A)20+4PIN,2*SATA,3*big 4pin,1*small 4	main	0	\N	web
1725	product_images/power-unit-delux-dlp-30d-420w360a204pin2sata3big-4pin1small-4_1.jpg	f	756	Power Unit DELUX DLP-30D 420W(360A)20+4PIN,2*SATA,3*big 4pin,1*small 4	gallery	1	\N	web
1726	product_images/power-unit-delux-dlp-30d-420w360a204pin2sata3big-4pin1small-4_2.jpg	f	756	Power Unit DELUX DLP-30D 420W(360A)20+4PIN,2*SATA,3*big 4pin,1*small 4	gallery	2	\N	web
1727	product_images/naushniki-s-mikrofonom-a4tech-bloody-g570-rgb-gaming_2.jpg	f	700	Наушники с микрофоном A4Tech BLOODY G570 RGB Gaming	gallery	2	\N	web
1728	product_images/naushniki-s-mikrofonom-a4tech-bloody-g570-rgb-gaming_4.jpg	f	700	Наушники с микрофоном A4Tech BLOODY G570 RGB Gaming	gallery	4	\N	web
1729	product_images/naushniki-s-mikrofonom-a4tech-bloody-g570-rgb-gaming_8.jpg	f	700	Наушники с микрофоном A4Tech BLOODY G570 RGB Gaming	gallery	8	\N	web
1730	product_images/ryukzak-dlya-noutbuka-promate-zestblackgreyblue-154_3.jpg	f	852	Рюкзак для ноутбука Promate ZEST.Black/Grey/Blue "15,4"	gallery	3	\N	web
1731	product_images/ryukzak-dlya-noutbuka-promate-zestblackgreyblue-154_4.jpg	f	852	Рюкзак для ноутбука Promate ZEST.Black/Grey/Blue "15,4"	gallery	4	\N	web
1732	product_images/ryukzak-dlya-noutbuka-promate-zestblackgreyblue-154_7.jpg	f	852	Рюкзак для ноутбука Promate ZEST.Black/Grey/Blue "15,4"	gallery	7	\N	web
1734	product_images/ddr4-8gb-pc-21333-hikvisiondahua_4.jpg	f	620	DDR4 8GB PC-21333 - Hikvision\\Dahua	gallery	4	\N	web
1735	product_images/ddr4-8gb-pc-21333-hikvisiondahua_6.jpg	f	620	DDR4 8GB PC-21333 - Hikvision\\Dahua	gallery	6	\N	web
1736	product_images/cable-vga-3m_0.jpg	t	518	Cable VGA 3м	main	0	\N	web
1737	product_images/cable-vga-3m_1.jpg	f	518	Cable VGA 3м	gallery	1	\N	web
1738	product_images/cable-vga-3m_2.jpg	f	518	Cable VGA 3м	gallery	2	\N	web
1739	product_images/cooler-p4_0.jpg	t	549	Cooler P4	main	0	\N	web
1740	product_images/cooler-p4_1.jpg	f	549	Cooler P4	gallery	1	\N	web
1741	product_images/cooler-p4_2.jpg	f	549	Cooler P4	gallery	2	\N	web
1742	product_images/pylesos-1000w_0.jpg	t	836	Пылесос 1000W	main	0	\N	web
1743	product_images/pylesos-1000w_7.webp	f	836	Пылесос 1000W	gallery	7	\N	web
1744	product_images/blok-pitaniya-ot-modema-9v-2a_0.jpg	t	847	Блок питания от модема 9V / 2А	main	0	\N	web
1745	product_images/blok-pitaniya-ot-modema-9v-2a_1.jpg	f	847	Блок питания от модема 9V / 2А	gallery	1	\N	web
1746	product_images/blok-pitaniya-ot-modema-9v-2a_6.jpg	f	847	Блок питания от модема 9V / 2А	gallery	6	\N	web
1747	product_images/schiptsy-obzhimnyy-rj-45-rj-11-hsd-568r_0.jpg	t	745	Щипцы обжимный RJ-45 ,RJ-11 HSD 568R	main	0	\N	web
1748	product_images/schiptsy-obzhimnyy-rj-45-rj-11-hsd-568r_2.jpg	f	745	Щипцы обжимный RJ-45 ,RJ-11 HSD 568R	gallery	2	\N	web
1749	product_images/schiptsy-obzhimnyy-rj-45-rj-11-hsd-568r_3.jpg	f	745	Щипцы обжимный RJ-45 ,RJ-11 HSD 568R	gallery	3	\N	web
1750	product_images/canon-laserbase-i-sensys-mf3010-kartridzh-725-usb_1.webp	f	765	Canon LaserBase i-SENSYS MF3010 (картридж 725 + USB)	gallery	1	\N	web
1751	product_images/canon-laserbase-i-sensys-mf3010-kartridzh-725-usb_3.jpg	f	765	Canon LaserBase i-SENSYS MF3010 (картридж 725 + USB)	gallery	3	\N	web
1752	product_images/canon-laserbase-i-sensys-mf3010-kartridzh-725-usb_5.jpg	f	765	Canon LaserBase i-SENSYS MF3010 (картридж 725 + USB)	gallery	5	\N	web
1753	product_images/mouse-genius-dx-125-usb-optical_0.jpg	t	667	Mouse Genius DX-125 USB Optical	main	0	\N	web
1754	product_images/mouse-genius-dx-125-usb-optical_2.jpg	f	667	Mouse Genius DX-125 USB Optical	gallery	2	\N	web
1755	product_images/mouse-genius-dx-125-usb-optical_5.jpg	f	667	Mouse Genius DX-125 USB Optical	gallery	5	\N	web
1756	product_images/speakers-genius-sp-q160-dark-grey-6w-3w-x-2-usb_0.jpg	t	786	Speakers Genius SP-Q160 Dark Grey, 6W (3W x 2), USB	main	0	\N	web
1757	product_images/speakers-genius-sp-q160-dark-grey-6w-3w-x-2-usb_2.jpg	f	786	Speakers Genius SP-Q160 Dark Grey, 6W (3W x 2), USB	gallery	2	\N	web
1758	product_images/speakers-genius-sp-q160-dark-grey-6w-3w-x-2-usb_7.jpg	f	786	Speakers Genius SP-Q160 Dark Grey, 6W (3W x 2), USB	gallery	7	\N	web
1759	product_images/wireless-lan-adapter-tp-link-tl-wn751nd-wi-fi-150mb-pci_8.jpg	f	733	Wireless LAN Adapter TP-Link TL-WN751ND Wi-Fi 150Mb PCI	gallery	8	\N	web
1760	product_images/kreslo-krutyaschiesya-kachayuschiesya-chernoe-komfort-zheleznye-ruchki_0.jpg	t	825	Кресло крутящиеся - качающиеся черное "Комфорт" железные ручки	main	0	\N	web
1761	product_images/kreslo-krutyaschiesya-kachayuschiesya-chernoe-komfort-zheleznye-ruchki_1.jpg	f	825	Кресло крутящиеся - качающиеся черное "Комфорт" железные ручки	gallery	1	\N	web
1762	product_images/kreslo-krutyaschiesya-kachayuschiesya-chernoe-komfort-zheleznye-ruchki_2.jpg	f	825	Кресло крутящиеся - качающиеся черное "Комфорт" железные ручки	gallery	2	\N	web
1763	product_images/naushniki-s-mikrofonom-genius-hs-g600v-dugovye-2-x-mini-jack-35-mm_0.jpg	t	706	Наушники с микрофоном Genius HS-G600V, Дуговые, 2 x mini jack 3.5 mm,	main	0	\N	web
1764	product_images/naushniki-s-mikrofonom-genius-hs-g600v-dugovye-2-x-mini-jack-35-mm_1.jpg	f	706	Наушники с микрофоном Genius HS-G600V, Дуговые, 2 x mini jack 3.5 mm,	gallery	1	\N	web
1765	product_images/naushniki-s-mikrofonom-genius-hs-g600v-dugovye-2-x-mini-jack-35-mm_4.png	f	706	Наушники с микрофоном Genius HS-G600V, Дуговые, 2 x mini jack 3.5 mm,	gallery	4	\N	web
1766	product_images/chehol-dlya-plansheta-gelevyy-101-detskiy_1.jpg	f	838	Чехол для планшета гелевый 10,1" (детский)	gallery	1	\N	web
1767	product_images/chehol-dlya-plansheta-gelevyy-101-detskiy_2.jpg	f	838	Чехол для планшета гелевый 10,1" (детский)	gallery	2	\N	web
1768	product_images/chehol-dlya-plansheta-gelevyy-101-detskiy_4.jpg	f	838	Чехол для планшета гелевый 10,1" (детский)	gallery	4	\N	web
1769	product_images/cetevoy-filtr-ekspert-3rozetki-3m_1.jpg	f	555	Cетевой фильтр Эксперт - 3розетки 3м	gallery	1	\N	web
1770	product_images/cetevoy-filtr-ekspert-3rozetki-3m_2.jpg	f	555	Cетевой фильтр Эксперт - 3розетки 3м	gallery	2	\N	web
1771	product_images/cetevoy-filtr-ekspert-3rozetki-3m_4.png	f	555	Cетевой фильтр Эксперт - 3розетки 3м	gallery	4	\N	web
1772	product_images/rtx-3050-asus-dual-geforce-rtx-3050-6gb-gddr6-92bit_0.jpg	t	805	RTX 3050 ASUS Dual GeForce RTX 3050 6GB GDDR6, 92Bit	main	0	\N	web
1773	product_images/rtx-3050-asus-dual-geforce-rtx-3050-6gb-gddr6-92bit_1.jpg	f	805	RTX 3050 ASUS Dual GeForce RTX 3050 6GB GDDR6, 92Bit	gallery	1	\N	web
1774	product_images/rtx-3050-asus-dual-geforce-rtx-3050-6gb-gddr6-92bit_2.jpg	f	805	RTX 3050 ASUS Dual GeForce RTX 3050 6GB GDDR6, 92Bit	gallery	2	\N	web
1775	product_images/kuler-dlya-protsessora-for-intel-lga170012001156115511511150-origin_0.jpg	t	554	Кулер для процессора for Intel LGA1700/1200/1156/1155/1151/1150 ORIGIN	main	0	\N	web
1818	product_images/sumka-dlya-noutbuka-rivacase-7731-156_2.jpg	f	861	Сумка для ноутбука RivaCase 7731 15,6"	gallery	2	\N	web
1776	product_images/kuler-dlya-protsessora-for-intel-lga170012001156115511511150-origin_1.jpg	f	554	Кулер для процессора for Intel LGA1700/1200/1156/1155/1151/1150 ORIGIN	gallery	1	\N	web
1777	product_images/kuler-dlya-protsessora-for-intel-lga170012001156115511511150-origin_3.jpg	f	554	Кулер для процессора for Intel LGA1700/1200/1156/1155/1151/1150 ORIGIN	gallery	3	\N	web
1778	product_images/antivirus-kasperskiy-prodlenie_1.jpg	f	815	Антивирус Касперский продление	gallery	1	\N	web
1779	product_images/antivirus-kasperskiy-prodlenie_2.png	f	815	Антивирус Касперский продление	gallery	2	\N	web
1780	product_images/antivirus-kasperskiy-prodlenie_6.png	f	815	Антивирус Касперский продление	gallery	6	\N	web
1781	product_images/microlab-subwoofer-m-100-mkii-21-black-10w-5w25w2_2.webp	f	774	Microlab Subwoofer M-100 MKII 2.1 BLACK 10W (5W+2.5W*2	gallery	2	\N	web
1782	product_images/share-q27-i5-12400-16gb-sodimm-ddr4-1tb-ssd-m2-nvme-27-fhd-ips-c_0.jpg	t	833	Share Q27, i5-12400, 16GB SODIMM DDR4, 1TB SSD m.2 NVMe, 27" FHD IPS C	main	0	\N	web
1783	product_images/share-q27-i5-12400-16gb-sodimm-ddr4-1tb-ssd-m2-nvme-27-fhd-ips-c_1.png	f	833	Share Q27, i5-12400, 16GB SODIMM DDR4, 1TB SSD m.2 NVMe, 27" FHD IPS C	gallery	1	\N	web
1784	product_images/share-q27-i5-12400-16gb-sodimm-ddr4-1tb-ssd-m2-nvme-27-fhd-ips-c_2.jpg	f	833	Share Q27, i5-12400, 16GB SODIMM DDR4, 1TB SSD m.2 NVMe, 27" FHD IPS C	gallery	2	\N	web
1785	product_images/cable-utp-5-hikvision-dlya-vneshnih-rabot_0.png	t	714	Cable UTP-5 Hikvision для внешних работ	main	0	\N	web
1786	product_images/cable-utp-5-hikvision-dlya-vneshnih-rabot_1.jpg	f	714	Cable UTP-5 Hikvision для внешних работ	gallery	1	\N	web
1787	product_images/cable-utp-5-hikvision-dlya-vneshnih-rabot_2.jpg	f	714	Cable UTP-5 Hikvision для внешних работ	gallery	2	\N	web
1788	product_images/power-cable-for-monitor_0.jpg	t	523	Power cable for monitor	main	0	\N	web
1789	product_images/power-cable-for-monitor_1.jpg	f	523	Power cable for monitor	gallery	1	\N	web
1790	product_images/power-cable-for-monitor_2.jpg	f	523	Power cable for monitor	gallery	2	\N	web
1791	product_images/ohlazhdayuschaya-podstavka-dlya-planshetanoutbuka-zalman-zm-ns1000_0.jpg	t	839	Охлаждающая подставка для планшета/ноутбука Zalman ZM-NS1000	main	0	\N	web
1792	product_images/ohlazhdayuschaya-podstavka-dlya-planshetanoutbuka-zalman-zm-ns1000_4.jpg	f	839	Охлаждающая подставка для планшета/ноутбука Zalman ZM-NS1000	gallery	4	\N	web
1793	product_images/ohlazhdayuschaya-podstavka-dlya-planshetanoutbuka-zalman-zm-ns1000_8.jpg	f	839	Охлаждающая подставка для планшета/ноутбука Zalman ZM-NS1000	gallery	8	\N	web
1794	product_images/laminator-a4-comix-f9099b-2-vala-75-125-mkm-30-smmin-seryy_3.jpg	f	834	Ламинатор А4, COMIX, F9099B, 2 вала, 75-125 мкм, 30 см/мин., Серый	gallery	3	\N	web
1795	product_images/laminator-a4-comix-f9099b-2-vala-75-125-mkm-30-smmin-seryy_8.jpg	f	834	Ламинатор А4, COMIX, F9099B, 2 вала, 75-125 мкм, 30 см/мин., Серый	gallery	8	\N	web
1796	product_images/kabel-hdmi-hdmi-15-m_0.jpg	t	526	Кабель HDMI - HDMI 1.5 m	main	0	\N	web
1797	product_images/kabel-hdmi-hdmi-15-m_1.jpg	f	526	Кабель HDMI - HDMI 1.5 m	gallery	1	\N	web
1798	product_images/kabel-hdmi-hdmi-15-m_2.jpg	f	526	Кабель HDMI - HDMI 1.5 m	gallery	2	\N	web
1799	product_images/cable-usb-15-m-udlinitel-ekranir_1.jpg	f	508	Cable USB 1.5 m (удлинитель) экранир	gallery	1	\N	web
1800	product_images/cable-usb-15-m-udlinitel-ekranir_2.jpg	f	508	Cable USB 1.5 m (удлинитель) экранир	gallery	2	\N	web
1801	product_images/cable-usb-15-m-udlinitel-ekranir_3.jpg	f	508	Cable USB 1.5 m (удлинитель) экранир	gallery	3	\N	web
1802	product_images/filter-ritech-5m-3-rozetki_1.png	f	559	Filter Ritech 5м 3 розетки	gallery	1	\N	web
1803	product_images/filter-ritech-5m-3-rozetki_2.jpg	f	559	Filter Ritech 5м 3 розетки	gallery	2	\N	web
1804	product_images/filter-ritech-5m-3-rozetki_3.png	f	559	Filter Ritech 5м 3 розетки	gallery	3	\N	web
1805	product_images/mouse-a4tech-g9-110f-v-track-mouse-wireless-usb-black_7.jpg	f	662	Mouse A4TECH G9-110F V-TRACK MOUSE WIRELESS USB BLACK	gallery	7	\N	web
1806	product_images/mouse-a4tech-g9-110f-v-track-mouse-wireless-usb-black_8.jpg	f	662	Mouse A4TECH G9-110F V-TRACK MOUSE WIRELESS USB BLACK	gallery	8	\N	web
1807	product_images/antivirus-drweb-security-space-2pk-1god-prodlenie_0.png	t	812	Антивирус Dr.Web Security Space 2пк \\ 1год продление	main	0	\N	web
1808	product_images/antivirus-drweb-security-space-2pk-1god-prodlenie_1.jpg	f	812	Антивирус Dr.Web Security Space 2пк \\ 1год продление	gallery	1	\N	web
1809	product_images/antivirus-drweb-security-space-2pk-1god-prodlenie_3.jpg	f	812	Антивирус Dr.Web Security Space 2пк \\ 1год продление	gallery	3	\N	web
1810	product_images/pen-drive-256gb-usb-3132_0.jpg	t	563	PEN DRIVE 256GB USB 3.1\\3.2	main	0	\N	web
1811	product_images/pen-drive-256gb-usb-3132_3.jpg	f	563	PEN DRIVE 256GB USB 3.1\\3.2	gallery	3	\N	web
1812	product_images/pen-drive-256gb-usb-3132_4.jpg	f	563	PEN DRIVE 256GB USB 3.1\\3.2	gallery	4	\N	web
1813	product_images/krestovina_0.png	t	827	Крестовина	main	0	\N	web
1814	product_images/krestovina_2.png	f	827	Крестовина	gallery	2	\N	web
1815	product_images/krestovina_3.jpg	f	827	Крестовина	gallery	3	\N	web
1816	product_images/sumka-dlya-noutbuka-rivacase-7731-156_0.jpg	t	861	Сумка для ноутбука RivaCase 7731 15,6"	main	0	\N	web
1817	product_images/sumka-dlya-noutbuka-rivacase-7731-156_1.jpg	f	861	Сумка для ноутбука RivaCase 7731 15,6"	gallery	1	\N	web
1819	product_images/a4tech-bloody-es5-esports-rgb-mouse-black-6000cpi-usb_0.jpg	t	640	A4TECH BLOODY ES5 ESPORTS RGB MOUSE BLACK 6000CPI USB	main	0	\N	web
1820	product_images/a4tech-bloody-es5-esports-rgb-mouse-black-6000cpi-usb_3.jpg	f	640	A4TECH BLOODY ES5 ESPORTS RGB MOUSE BLACK 6000CPI USB	gallery	3	\N	web
1821	product_images/a4tech-bloody-es5-esports-rgb-mouse-black-6000cpi-usb_4.jpg	f	640	A4TECH BLOODY ES5 ESPORTS RGB MOUSE BLACK 6000CPI USB	gallery	4	\N	web
1822	product_images/perehodnik-vga-1-na-2_0.jpg	t	504	Переходник VGA 1 на 2	main	0	\N	web
1823	product_images/perehodnik-vga-1-na-2_1.jpg	f	504	Переходник VGA 1 на 2	gallery	1	\N	web
1824	product_images/perehodnik-vga-1-na-2_2.jpg	f	504	Переходник VGA 1 на 2	gallery	2	\N	web
1825	product_images/cable-usb-ekronirovannyy-10m_1.jpg	f	512	Cable USB экронированный 10м	gallery	1	\N	web
1826	product_images/cable-usb-ekronirovannyy-10m_4.jpg	f	512	Cable USB экронированный 10м	gallery	4	\N	web
1827	product_images/cable-usb-ekronirovannyy-10m_7.jpg	f	512	Cable USB экронированный 10м	gallery	7	\N	web
1828	product_images/monitor-lcd-29-lg-29wq600-w-ips-2560x1080-100hz_0.jpg	t	633	Монитор LCD 29" LG 29WQ600-W IPS, 2560x1080, 100Hz	main	0	\N	web
1829	product_images/monitor-lcd-29-lg-29wq600-w-ips-2560x1080-100hz_1.jpg	f	633	Монитор LCD 29" LG 29WQ600-W IPS, 2560x1080, 100Hz	gallery	1	\N	web
1830	product_images/monitor-lcd-29-lg-29wq600-w-ips-2560x1080-100hz_2.jpg	f	633	Монитор LCD 29" LG 29WQ600-W IPS, 2560x1080, 100Hz	gallery	2	\N	web
1831	product_images/kronshteyn-dlya-tv-i-monitorov-deluxe-dllpa50-443-maks-nagruzka-50_1.jpg	f	816	Кронштейн для ТВ и мониторов, Deluxe, DLLPA50-443, Макс. нагрузка - 50	gallery	1	\N	web
1832	product_images/kronshteyn-dlya-tv-i-monitorov-deluxe-dllpa50-443-maks-nagruzka-50_4.jpg	f	816	Кронштейн для ТВ и мониторов, Deluxe, DLLPA50-443, Макс. нагрузка - 50	gallery	4	\N	web
1833	product_images/kronshteyn-dlya-tv-i-monitorov-deluxe-dllpa50-443-maks-nagruzka-50_6.jpg	f	816	Кронштейн для ТВ и мониторов, Deluxe, DLLPA50-443, Макс. нагрузка - 50	gallery	6	\N	web
1834	product_images/microlab-subwoofer-m-210-21-11w-5w3w2-black_0.jpg	t	779	Microlab Subwoofer M-210 2.1 11W (5W+3W*2) BLACK	main	0	\N	web
1835	product_images/microlab-subwoofer-m-210-21-11w-5w3w2-black_1.webp	f	779	Microlab Subwoofer M-210 2.1 11W (5W+3W*2) BLACK	gallery	1	\N	web
1836	product_images/microlab-subwoofer-m-210-21-11w-5w3w2-black_3.jpg	f	779	Microlab Subwoofer M-210 2.1 11W (5W+3W*2) BLACK	gallery	3	\N	web
1837	product_images/wireless-router-tp-link-tl-wr842n-wi-fi-300-mb-4-lan-100-mb-3g4g_0.jpg	t	738	Wireless Router TP-LINK TL-WR842N Wi-Fi 300 Мб, 4 LAN 100 Мб 3G\\4G	main	0	\N	web
1838	product_images/wireless-router-tp-link-tl-wr842n-wi-fi-300-mb-4-lan-100-mb-3g4g_2.jpg	f	738	Wireless Router TP-LINK TL-WR842N Wi-Fi 300 Мб, 4 LAN 100 Мб 3G\\4G	gallery	2	\N	web
1839	product_images/wireless-router-tp-link-tl-wr842n-wi-fi-300-mb-4-lan-100-mb-3g4g_3.jpg	f	738	Wireless Router TP-LINK TL-WR842N Wi-Fi 300 Мб, 4 LAN 100 Мб 3G\\4G	gallery	3	\N	web
1840	product_images/power-cable-for-monitor-18-belyy_0.jpg	t	524	Power cable for monitor 1.8 белый	main	0	\N	web
1841	product_images/power-cable-for-monitor-18-belyy_1.jpg	f	524	Power cable for monitor 1.8 белый	gallery	1	\N	web
1842	product_images/power-cable-for-monitor-18-belyy_2.jpg	f	524	Power cable for monitor 1.8 белый	gallery	2	\N	web
1843	product_images/kronshteyn-potolochnyy-dlya-proektora-brateckdeluxe_4.jpg	f	817	Кронштейн потолочный для проектора Brateck\\DELUXE	gallery	4	\N	web
1844	product_images/kronshteyn-potolochnyy-dlya-proektora-brateckdeluxe_5.jpg	f	817	Кронштейн потолочный для проектора Brateck\\DELUXE	gallery	5	\N	web
1845	product_images/kronshteyn-potolochnyy-dlya-proektora-brateckdeluxe_8.jpg	f	817	Кронштейн потолочный для проектора Brateck\\DELUXE	gallery	8	\N	web
1846	product_images/cable-sata_1.png	f	505	Cable SATA	gallery	1	\N	web
1847	product_images/cable-sata_2.jpg	f	505	Cable SATA	gallery	2	\N	web
1848	product_images/cable-sata_3.jpg	f	505	Cable SATA	gallery	3	\N	web
1849	product_images/psu-jump-dr-420r-total-400w-24pin4p1fdd3sata2ata-shield_0.jpg	t	763	PSU Jump DR-420R (total 400W) 24PIN+4P+1FDD+3SATA+2ATA, Shield	main	0	\N	web
1850	product_images/psu-jump-dr-420r-total-400w-24pin4p1fdd3sata2ata-shield_2.jpg	f	763	PSU Jump DR-420R (total 400W) 24PIN+4P+1FDD+3SATA+2ATA, Shield	gallery	2	\N	web
1851	product_images/psu-jump-dr-420r-total-400w-24pin4p1fdd3sata2ata-shield_3.jpg	f	763	PSU Jump DR-420R (total 400W) 24PIN+4P+1FDD+3SATA+2ATA, Shield	gallery	3	\N	web
1852	product_images/mysh-ritmix-rom-311-black-800-2400-dpi-podsvetka-7-tsvetov_0.jpg	t	686	Мышь RITMIX ROM-311 Black 800-2400 dpi; подсветка 7 цветов	main	0	\N	web
1853	product_images/mysh-ritmix-rom-311-black-800-2400-dpi-podsvetka-7-tsvetov_3.jpg	f	686	Мышь RITMIX ROM-311 Black 800-2400 dpi; подсветка 7 цветов	gallery	3	\N	web
1854	product_images/mysh-ritmix-rom-311-black-800-2400-dpi-podsvetka-7-tsvetov_4.jpg	f	686	Мышь RITMIX ROM-311 Black 800-2400 dpi; подсветка 7 цветов	gallery	4	\N	web
1855	product_images/mysh-ritmix-rom-306-black-1000-dpi-podsvetka-7-tsvetov_6.png	f	684	Мышь RITMIX ROM-306 Black 1000 dpi; подсветка 7 цветов	gallery	6	\N	web
1856	product_images/mysh-ritmix-rom-306-black-1000-dpi-podsvetka-7-tsvetov_7.jpg	f	684	Мышь RITMIX ROM-306 Black 1000 dpi; подсветка 7 цветов	gallery	7	\N	web
1857	product_images/matplata-maxsun-ms-challenger-h810m-f-lga1851-intel-h810-2xddr5_1.png	f	614	Матплата MAXSUN MS-Challenger H810M-F, LGA1851, Intel H810, 2xDDR5	gallery	1	\N	web
1858	product_images/matplata-maxsun-ms-challenger-h810m-f-lga1851-intel-h810-2xddr5_3.jpg	f	614	Матплата MAXSUN MS-Challenger H810M-F, LGA1851, Intel H810, 2xDDR5	gallery	3	\N	web
1859	product_images/matplata-maxsun-ms-challenger-h810m-f-lga1851-intel-h810-2xddr5_4.jpg	f	614	Матплата MAXSUN MS-Challenger H810M-F, LGA1851, Intel H810, 2xDDR5	gallery	4	\N	web
1860	product_images/zaryadnoe-ustroystvo-na-noutbuk-120w_0.jpg	t	848	Зарядное устройство на ноутбук - 120W	main	0	\N	web
1861	product_images/zaryadnoe-ustroystvo-na-noutbuk-120w_1.jpg	f	848	Зарядное устройство на ноутбук - 120W	gallery	1	\N	web
1862	product_images/zaryadnoe-ustroystvo-na-noutbuk-120w_2.webp	f	848	Зарядное устройство на ноутбук - 120W	gallery	2	\N	web
1863	product_images/lenovo-v15-g2-ijl-intel-n4500-8gb-512gb-m2-156-full-hd-1920x108_1.jpg	f	752	Lenovo V15 G2 IJL Intel N4500, 8GB, 512GB M.2, 15.6" FULL HD (1920x108	gallery	1	\N	web
1864	product_images/lenovo-v15-g2-ijl-intel-n4500-8gb-512gb-m2-156-full-hd-1920x108_2.jpg	f	752	Lenovo V15 G2 IJL Intel N4500, 8GB, 512GB M.2, 15.6" FULL HD (1920x108	gallery	2	\N	web
1865	product_images/lenovo-v15-g2-ijl-intel-n4500-8gb-512gb-m2-156-full-hd-1920x108_4.jpg	f	752	Lenovo V15 G2 IJL Intel N4500, 8GB, 512GB M.2, 15.6" FULL HD (1920x108	gallery	4	\N	web
1866	product_images/keyboard-mouse-genius-km-160-black-usb-ru-go-170001_0.jpg	t	594	Keyboard + Mouse Genius KM-160, Black, USB, RU, GO-170001	main	0	\N	web
1867	product_images/keyboard-mouse-genius-km-160-black-usb-ru-go-170001_2.jpg	f	594	Keyboard + Mouse Genius KM-160, Black, USB, RU, GO-170001	gallery	2	\N	web
1868	product_images/keyboard-mouse-genius-km-160-black-usb-ru-go-170001_5.png	f	594	Keyboard + Mouse Genius KM-160, Black, USB, RU, GO-170001	gallery	5	\N	web
1869	product_images/a4tech-x89-oscar-neon-stone-2400-dpi-game-mouse-usb-black_3.jpg	f	655	A4TECH X89 OSCAR NEON STONE 2400 DPI GAME MOUSE USB BLACK	gallery	3	\N	web
1870	product_images/a4tech-x89-oscar-neon-stone-2400-dpi-game-mouse-usb-black_5.jpg	f	655	A4TECH X89 OSCAR NEON STONE 2400 DPI GAME MOUSE USB BLACK	gallery	5	\N	web
1871	product_images/a4tech-x89-oscar-neon-stone-2400-dpi-game-mouse-usb-black_6.jpg	f	655	A4TECH X89 OSCAR NEON STONE 2400 DPI GAME MOUSE USB BLACK	gallery	6	\N	web
1872	product_images/ryukzak-dlya-noutbuka-rivacase-7560-canvas-156_4.jpg	f	853	Рюкзак для ноутбука RivaCase 7560 Canvas 15.6"	gallery	4	\N	web
1873	product_images/ryukzak-dlya-noutbuka-rivacase-7560-canvas-156_7.jpg	f	853	Рюкзак для ноутбука RivaCase 7560 Canvas 15.6"	gallery	7	\N	web
1874	product_images/lg-27gn950-b-27-4k-144hz-nano-ips_0.jpg	t	466	LG 27GN950-B 27" 4K 144Hz Nano IPS	main	0	\N	web
1875	product_images/lg-27gn950-b-27-4k-144hz-nano-ips_3.png	f	466	LG 27GN950-B 27" 4K 144Hz Nano IPS	gallery	3	\N	web
1876	product_images/lg-27gn950-b-27-4k-144hz-nano-ips_5.jpg	f	466	LG 27GN950-B 27" 4K 144Hz Nano IPS	gallery	5	\N	web
1877	product_images/ddr4-16gb-pc-21333-twinmos_2.png	f	617	DDR4 16GB PC-21333 TWINMOS	gallery	2	\N	web
1878	product_images/ddr4-16gb-pc-21333-twinmos_3.jpg	f	617	DDR4 16GB PC-21333 TWINMOS	gallery	3	\N	web
1879	product_images/ddr4-16gb-pc-21333-twinmos_6.png	f	617	DDR4 16GB PC-21333 TWINMOS	gallery	6	\N	web
1880	product_images/mouse-winstar-ws-ms-901-usb_0.jpg	t	674	Mouse Winstar WS-MS-901 USB	main	0	\N	web
1881	product_images/mouse-winstar-ws-ms-901-usb_2.jpg	f	674	Mouse Winstar WS-MS-901 USB	gallery	2	\N	web
1882	product_images/mouse-winstar-ws-ms-901-usb_5.jpg	f	674	Mouse Winstar WS-MS-901 USB	gallery	5	\N	web
1883	product_images/mouse-winstar-razeak-rm-142-gaming-rgb-usb_2.jpg	f	672	Mouse Winstar Razeak RM-142 Gaming RGB USB	gallery	2	\N	web
1884	product_images/mouse-winstar-razeak-rm-142-gaming-rgb-usb_4.jpg	f	672	Mouse Winstar Razeak RM-142 Gaming RGB USB	gallery	4	\N	web
1885	product_images/mouse-winstar-razeak-rm-142-gaming-rgb-usb_5.jpg	f	672	Mouse Winstar Razeak RM-142 Gaming RGB USB	gallery	5	\N	web
1886	product_images/microlab-subwoofer-m-110-21-10w-5w25w2-black_0.jpg	t	777	Microlab Subwoofer M-110 2.1 10W (5W+2.5W*2) BLACK	main	0	\N	web
1887	product_images/microlab-subwoofer-m-110-21-10w-5w25w2-black_1.jpg	f	777	Microlab Subwoofer M-110 2.1 10W (5W+2.5W*2) BLACK	gallery	1	\N	web
1888	product_images/microlab-subwoofer-m-110-21-10w-5w25w2-black_4.jpg	f	777	Microlab Subwoofer M-110 2.1 10W (5W+2.5W*2) BLACK	gallery	4	\N	web
1889	product_images/ssd-512gb-jump-ds-25-sata3-b-chteniezapis-550500mbs_0.jpg	t	582	SSD 512GB Jump DS 2.5" SATA3 B чтение/запись 550/500MB/s	main	0	\N	web
1890	product_images/ssd-512gb-jump-ds-25-sata3-b-chteniezapis-550500mbs_1.jpg	f	582	SSD 512GB Jump DS 2.5" SATA3 B чтение/запись 550/500MB/s	gallery	1	\N	web
1891	product_images/ssd-512gb-jump-ds-25-sata3-b-chteniezapis-550500mbs_2.jpg	f	582	SSD 512GB Jump DS 2.5" SATA3 B чтение/запись 550/500MB/s	gallery	2	\N	web
1892	product_images/uniview-27-mw-lc27s-ips-led-fhd-19201080-vga-hdmi_0.webp	t	629	UNIVIEW 27" MW-LC27S IPS LED FHD 1920,1080 VGA HDMI	main	0	\N	web
1893	product_images/uniview-27-mw-lc27s-ips-led-fhd-19201080-vga-hdmi_3.png	f	629	UNIVIEW 27" MW-LC27S IPS LED FHD 1920,1080 VGA HDMI	gallery	3	\N	web
1894	product_images/uniview-27-mw-lc27s-ips-led-fhd-19201080-vga-hdmi_4.jpg	f	629	UNIVIEW 27" MW-LC27S IPS LED FHD 1920,1080 VGA HDMI	gallery	4	\N	web
1895	product_images/kabel-pitaniya-video-karty_0.jpg	t	533	Кабель питания Видео карты	main	0	\N	web
1896	product_images/kabel-pitaniya-video-karty_4.jpg	f	533	Кабель питания Видео карты	gallery	4	\N	web
1897	product_images/kabel-pitaniya-video-karty_7.jpg	f	533	Кабель питания Видео карты	gallery	7	\N	web
1898	product_images/a4tech-kr-8572-kr-85op-720-keyboardmouse-set-usb-black-usrussian_0.jpg	t	588	A4TECH KR-8572 (KR-85+OP-720) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	main	0	\N	web
1899	product_images/a4tech-kr-8572-kr-85op-720-keyboardmouse-set-usb-black-usrussian_2.jpg	f	588	A4TECH KR-8572 (KR-85+OP-720) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	2	\N	web
2385	product_images/power-cable-15m-chernyy_4.jpg	f	521	Power cable 1,5м черный	gallery	4	\N	web
1900	product_images/a4tech-kr-8572-kr-85op-720-keyboardmouse-set-usb-black-usrussian_4.jpg	f	588	A4TECH KR-8572 (KR-85+OP-720) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	4	\N	web
1901	product_images/akusticheskaya-sistema-21-sven-ms-304-chernyy-rms-40vt202x10-sd-slo_4.jpg	f	796	Акустическая система 2.1 SVEN MS-304 черный, RMS 40Вт(20+2x10), SD сло	gallery	4	\N	web
1902	product_images/philips-27-27e2n1100l-va-led-wide-1920x1080-100hz_0.jpg	t	624	PHILIPS 27" 27E2N1100L VA LED WIDE 1920x1080 100HZ	main	0	\N	web
1903	product_images/philips-27-27e2n1100l-va-led-wide-1920x1080-100hz_2.jpg	f	624	PHILIPS 27" 27E2N1100L VA LED WIDE 1920x1080 100HZ	gallery	2	\N	web
1904	product_images/philips-27-27e2n1100l-va-led-wide-1920x1080-100hz_3.jpg	f	624	PHILIPS 27" 27E2N1100L VA LED WIDE 1920x1080 100HZ	gallery	3	\N	web
1905	product_images/philips-27-27m2n3200s-evnia-gaming-ips-1920x1080-180hz-178178-10001_4.jpg	f	626	PHILIPS 27" 27M2N3200S EVNIA GAMING IPS 1920x1080 180HZ 178/178 1000:1	gallery	4	\N	web
1906	product_images/philips-27-27m2n3200s-evnia-gaming-ips-1920x1080-180hz-178178-10001_5.jpg	f	626	PHILIPS 27" 27M2N3200S EVNIA GAMING IPS 1920x1080 180HZ 178/178 1000:1	gallery	5	\N	web
1907	product_images/philips-27-27m2n3200s-evnia-gaming-ips-1920x1080-180hz-178178-10001_7.jpg	f	626	PHILIPS 27" 27M2N3200S EVNIA GAMING IPS 1920x1080 180HZ 178/178 1000:1	gallery	7	\N	web
1908	product_images/hub-usb-4port-deshovyy_1.jpg	f	843	HUB USB- 4Port - дешовый	gallery	1	\N	web
1909	product_images/hub-usb-4port-deshovyy_2.jpg	f	843	HUB USB- 4Port - дешовый	gallery	2	\N	web
1910	product_images/hub-usb-4port-deshovyy_6.jpg	f	843	HUB USB- 4Port - дешовый	gallery	6	\N	web
1911	product_images/kreslo-krutyaschiesya-kachayuschiesya-v-rombik-6911_2.jpg	f	823	Кресло крутящиеся - качающиеся в ромбик (6911)	gallery	2	\N	web
1912	product_images/kreslo-krutyaschiesya-kachayuschiesya-v-rombik-6911_4.jpg	f	823	Кресло крутящиеся - качающиеся в ромбик (6911)	gallery	4	\N	web
1913	product_images/kreslo-krutyaschiesya-kachayuschiesya-v-rombik-6911_5.jpg	f	823	Кресло крутящиеся - качающиеся в ромбик (6911)	gallery	5	\N	web
1914	product_images/naushniki-s-mikrofonom-genius-hs-g560-2xjack-20hz-20khz-91db-54db-ch_0.png	t	705	Наушники с микрофоном Genius HS-G560 2xJack, 20Hz-20kHz, 91dB/-54dB, Ч	main	0	\N	web
1915	product_images/naushniki-s-mikrofonom-genius-hs-g560-2xjack-20hz-20khz-91db-54db-ch_1.jpg	f	705	Наушники с микрофоном Genius HS-G560 2xJack, 20Hz-20kHz, 91dB/-54dB, Ч	gallery	1	\N	web
1916	product_images/naushniki-s-mikrofonom-genius-hs-g560-2xjack-20hz-20khz-91db-54db-ch_3.png	f	705	Наушники с микрофоном Genius HS-G560 2xJack, 20Hz-20kHz, 91dB/-54dB, Ч	gallery	3	\N	web
1917	product_images/podstavka-ohlazhd-dlya-noutbuka-noutbukadeepcool-pal-mini-dp-n114_0.jpg	t	841	Подставка охлажд. для ноутбука ноутбука,Deepcool PAL MINI DP-N114	main	0	\N	web
1918	product_images/podstavka-ohlazhd-dlya-noutbuka-noutbukadeepcool-pal-mini-dp-n114_2.jpg	f	841	Подставка охлажд. для ноутбука ноутбука,Deepcool PAL MINI DP-N114	gallery	2	\N	web
1919	product_images/podstavka-ohlazhd-dlya-noutbuka-noutbukadeepcool-pal-mini-dp-n114_3.jpg	f	841	Подставка охлажд. для ноутбука ноутбука,Deepcool PAL MINI DP-N114	gallery	3	\N	web
1920	product_images/wi-fi-aprouter-tp-link-archer-c20-ac750-wireless-dual-band-router_0.jpg	t	727	Wi-Fi AP+Router TP-Link Archer C20 AC750 Wireless Dual Band Router	main	0	\N	web
1921	product_images/wi-fi-aprouter-tp-link-archer-c20-ac750-wireless-dual-band-router_2.jpg	f	727	Wi-Fi AP+Router TP-Link Archer C20 AC750 Wireless Dual Band Router	gallery	2	\N	web
1922	product_images/wi-fi-aprouter-tp-link-archer-c20-ac750-wireless-dual-band-router_3.jpg	f	727	Wi-Fi AP+Router TP-Link Archer C20 AC750 Wireless Dual Band Router	gallery	3	\N	web
1923	product_images/microlab-subwoofer-m-270-21-11w-5w3w2-usbblack_0.jpg	t	781	Microlab Subwoofer M-270 2.1 11W (5W+3W*2) USB\\BLACK	main	0	\N	web
1924	product_images/microlab-subwoofer-m-270-21-11w-5w3w2-usbblack_1.jpg	f	781	Microlab Subwoofer M-270 2.1 11W (5W+3W*2) USB\\BLACK	gallery	1	\N	web
1925	product_images/microlab-subwoofer-m-270-21-11w-5w3w2-usbblack_7.png	f	781	Microlab Subwoofer M-270 2.1 11W (5W+3W*2) USB\\BLACK	gallery	7	\N	web
1926	product_images/naushniki-sven-ap-u910mv-s-mikrofonom-usb-stereo_0.jpg	t	696	Наушники SVEN AP-U910MV с микрофоном USB stereo	main	0	\N	web
1927	product_images/naushniki-sven-ap-u910mv-s-mikrofonom-usb-stereo_1.jpg	f	696	Наушники SVEN AP-U910MV с микрофоном USB stereo	gallery	1	\N	web
1928	product_images/naushniki-sven-ap-u910mv-s-mikrofonom-usb-stereo_2.jpg	f	696	Наушники SVEN AP-U910MV с микрофоном USB stereo	gallery	2	\N	web
1929	product_images/philips-27-27m2n3500n-evnia-gaming-va-2560-x-1440-180hz-178178-10000_1.jpg	f	627	PHILIPS 27" 27M2N3500N EVNIA GAMING VA 2560 x 1440 180HZ 178/178 10000	gallery	1	\N	web
1930	product_images/philips-27-27m2n3500n-evnia-gaming-va-2560-x-1440-180hz-178178-10000_2.jpg	f	627	PHILIPS 27" 27M2N3500N EVNIA GAMING VA 2560 x 1440 180HZ 178/178 10000	gallery	2	\N	web
1931	product_images/philips-27-27m2n3500n-evnia-gaming-va-2560-x-1440-180hz-178178-10000_5.jpg	f	627	PHILIPS 27" 27M2N3500N EVNIA GAMING VA 2560 x 1440 180HZ 178/178 10000	gallery	5	\N	web
1932	product_images/web-cam-hikvision-ds-u02-1080p-fhd-usb-mic-black_0.jpg	t	689	Web Cam HIKVISION DS-U02 1080P FHD USB + Mic BLACK	main	0	\N	web
1933	product_images/web-cam-hikvision-ds-u02-1080p-fhd-usb-mic-black_1.png	f	689	Web Cam HIKVISION DS-U02 1080P FHD USB + Mic BLACK	gallery	1	\N	web
1934	product_images/web-cam-hikvision-ds-u02-1080p-fhd-usb-mic-black_3.jpg	f	689	Web Cam HIKVISION DS-U02 1080P FHD USB + Mic BLACK	gallery	3	\N	web
1935	product_images/a4tech-op-550-optical-mouse-usb-black_4.jpg	f	636	A4TECH OP-550 OPTICAL MOUSE USB BLACK	gallery	4	\N	web
1936	product_images/a4tech-op-550-optical-mouse-usb-black_5.jpg	f	636	A4TECH OP-550 OPTICAL MOUSE USB BLACK	gallery	5	\N	web
1937	product_images/a4tech-op-550-optical-mouse-usb-black_7.jpg	f	636	A4TECH OP-550 OPTICAL MOUSE USB BLACK	gallery	7	\N	web
1938	product_images/nastennyy-kronshteyn-dlya-tv-i-monitorov-65-100-dyuymov-55-kg_3.jpg	f	819	Настенный кронштейн для ТВ и мониторов 65 - 100 дюймов - 55 кг	gallery	3	\N	web
1939	product_images/keyboard-a4tech-k-100-black-usb-membrannaya-water-proof_0.jpg	t	595	Keyboard A4tech K-100, Black, USB, мембранная, Water-proof	main	0	\N	web
1940	product_images/keyboard-a4tech-k-100-black-usb-membrannaya-water-proof_1.jpg	f	595	Keyboard A4tech K-100, Black, USB, мембранная, Water-proof	gallery	1	\N	web
1941	product_images/keyboard-a4tech-k-100-black-usb-membrannaya-water-proof_3.jpg	f	595	Keyboard A4tech K-100, Black, USB, мембранная, Water-proof	gallery	3	\N	web
1942	product_images/besprovodnoy-marshrutizator-wi-fi-cudy-wr3000p-ax3000-gigabit-6-mesh-1_0.webp	t	741	Беспроводной маршрутизатор Wi-Fi CUDY WR3000P AX3000 Gigabit 6 Mesh 1.	main	0	\N	web
1943	product_images/besprovodnoy-marshrutizator-wi-fi-cudy-wr3000p-ax3000-gigabit-6-mesh-1_1.jpg	f	741	Беспроводной маршрутизатор Wi-Fi CUDY WR3000P AX3000 Gigabit 6 Mesh 1.	gallery	1	\N	web
1944	product_images/besprovodnoy-marshrutizator-wi-fi-cudy-wr3000p-ax3000-gigabit-6-mesh-1_2.jpg	f	741	Беспроводной маршрутизатор Wi-Fi CUDY WR3000P AX3000 Gigabit 6 Mesh 1.	gallery	2	\N	web
1945	product_images/a4tech-fstyler-fg5055-optical-mouse-wireless-2000dpi_0.jpg	t	651	A4TECH FSTYLER FG50\\55+ OPTICAL MOUSE WIRELESS 2000DPI	main	0	\N	web
1946	product_images/antivirus-drweb-security-space-2-pk-2-goda_0.png	t	813	Антивирус Dr.Web Security Space 2 пк \\ 2 года	main	0	\N	web
1947	product_images/antivirus-drweb-security-space-2-pk-2-goda_4.jpg	f	813	Антивирус Dr.Web Security Space 2 пк \\ 2 года	gallery	4	\N	web
1948	product_images/ryukzak-dlya-noutbuka-lenovo-b210-156-chernyy-seryy_0.jpg	t	851	Рюкзак для ноутбука Lenovo B210 15.6'' черный\\ серый	main	0	\N	web
1949	product_images/ryukzak-dlya-noutbuka-lenovo-b210-156-chernyy-seryy_1.jpg	f	851	Рюкзак для ноутбука Lenovo B210 15.6'' черный\\ серый	gallery	1	\N	web
1950	product_images/ryukzak-dlya-noutbuka-lenovo-b210-156-chernyy-seryy_5.jpg	f	851	Рюкзак для ноутбука Lenovo B210 15.6'' черный\\ серый	gallery	5	\N	web
1951	product_images/mysh-sven-rx-112-usb-chernaya_1.jpg	f	687	Мышь SVEN RX-112 USB черная	gallery	1	\N	web
1952	product_images/mysh-sven-rx-112-usb-chernaya_3.jpg	f	687	Мышь SVEN RX-112 USB черная	gallery	3	\N	web
1953	product_images/mysh-sven-rx-112-usb-chernaya_6.jpg	f	687	Мышь SVEN RX-112 USB черная	gallery	6	\N	web
1954	product_images/videokarta-rtx-5050-zotac-gaming-geforce-rtx-5050-8gb-gddr6_2.jpg	f	806	Видеокарта RTX 5050 ZOTAC GAMING GeForce RTX 5050 8GB GDDR6	gallery	2	\N	web
1955	product_images/videokarta-rtx-5050-zotac-gaming-geforce-rtx-5050-8gb-gddr6_7.jpg	f	806	Видеокарта RTX 5050 ZOTAC GAMING GeForce RTX 5050 8GB GDDR6	gallery	7	\N	web
1956	product_images/monitor-lcd-27-aoc-q27g4xf-fast-ips-black-2560x1440180hz-port-rezh_0.jpg	t	631	Монитор LCD 27" AOC Q27G4XF, FAST IPS, Black, 2560x1440\\180Hz порт реж	main	0	\N	web
1957	product_images/monitor-lcd-27-aoc-q27g4xf-fast-ips-black-2560x1440180hz-port-rezh_1.jpg	f	631	Монитор LCD 27" AOC Q27G4XF, FAST IPS, Black, 2560x1440\\180Hz порт реж	gallery	1	\N	web
1958	product_images/monitor-lcd-27-aoc-q27g4xf-fast-ips-black-2560x1440180hz-port-rezh_4.png	f	631	Монитор LCD 27" AOC Q27G4XF, FAST IPS, Black, 2560x1440\\180Hz порт реж	gallery	4	\N	web
1959	product_images/a4tech-bloody-b318-light-strike-gaming-8-ir-micro-switch-keyboard-usb_3.jpg	f	590	A4TECH BLOODY B318 LIGHT STRIKE GAMING 8 IR MICRO-SWITCH KEYBOARD USB	gallery	3	\N	web
1960	product_images/a4tech-bloody-b318-light-strike-gaming-8-ir-micro-switch-keyboard-usb_6.jpg	f	590	A4TECH BLOODY B318 LIGHT STRIKE GAMING 8 IR MICRO-SWITCH KEYBOARD USB	gallery	6	\N	web
1961	product_images/a4tech-bloody-b318-light-strike-gaming-8-ir-micro-switch-keyboard-usb_8.jpg	f	590	A4TECH BLOODY B318 LIGHT STRIKE GAMING 8 IR MICRO-SWITCH KEYBOARD USB	gallery	8	\N	web
1962	product_images/ssd-hikvision-hs-ssd-c100-480gb-tlc-25-sataiii_3.jpg	f	579	SSD HIKVISION HS-SSD-C100 480GB TLC 2,5"" SATAIII	gallery	3	\N	web
1963	product_images/ssd-hikvision-hs-ssd-c100-480gb-tlc-25-sataiii_5.jpg	f	579	SSD HIKVISION HS-SSD-C100 480GB TLC 2,5"" SATAIII	gallery	5	\N	web
1964	product_images/ssd-hikvision-hs-ssd-c100-480gb-tlc-25-sataiii_7.webp	f	579	SSD HIKVISION HS-SSD-C100 480GB TLC 2,5"" SATAIII	gallery	7	\N	web
1965	product_images/wi-fi-router-tp-link-archer-ax23-ax1800-dual-band-wi-fi-6_1.jpg	f	729	Wi-Fi Router TP-LINK Archer AX23 AX1800 Dual-Band Wi-Fi 6	gallery	1	\N	web
1966	product_images/wi-fi-router-tp-link-archer-ax23-ax1800-dual-band-wi-fi-6_3.jpg	f	729	Wi-Fi Router TP-LINK Archer AX23 AX1800 Dual-Band Wi-Fi 6	gallery	3	\N	web
1967	product_images/sumka-dlya-tsifrovoy-kamery-deshev_0.webp	t	868	Сумка для цифровой камеры дешев	main	0	\N	web
1968	product_images/sumka-dlya-tsifrovoy-kamery-deshev_3.webp	f	868	Сумка для цифровой камеры дешев	gallery	3	\N	web
1969	product_images/sumka-dlya-tsifrovoy-kamery-deshev_4.webp	f	868	Сумка для цифровой камеры дешев	gallery	4	\N	web
1970	product_images/wi-fi-router-tp-link-archer-c86-ac1900-dual-band-1300mbps-at-5ghz-6_0.jpg	t	730	Wi-Fi Router TP-LINK Archer C86 AC1900 Dual-Band, 1300Mbps at 5GHz + 6	main	0	\N	web
1971	product_images/wi-fi-router-tp-link-archer-c86-ac1900-dual-band-1300mbps-at-5ghz-6_1.jpg	f	730	Wi-Fi Router TP-LINK Archer C86 AC1900 Dual-Band, 1300Mbps at 5GHz + 6	gallery	1	\N	web
1972	product_images/wi-fi-router-tp-link-archer-c86-ac1900-dual-band-1300mbps-at-5ghz-6_4.jpg	f	730	Wi-Fi Router TP-LINK Archer C86 AC1900 Dual-Band, 1300Mbps at 5GHz + 6	gallery	4	\N	web
1973	product_images/ssd-hikvision-e1000std-128gb-3d-nand-m2_0.jpg	t	575	SSD HIKVISION E1000(STD) 128GB 3D NAND M.2	main	0	\N	web
1974	product_images/ssd-hikvision-e1000std-128gb-3d-nand-m2_4.jpg	f	575	SSD HIKVISION E1000(STD) 128GB 3D NAND M.2	gallery	4	\N	web
1975	product_images/ssd-hikvision-e1000std-128gb-3d-nand-m2_5.jpg	f	575	SSD HIKVISION E1000(STD) 128GB 3D NAND M.2	gallery	5	\N	web
1976	product_images/ups-anc-850va-avr-2-output-socket_1.jpg	f	800	UPS ANC 850VA (AVR), 2 Output Socket	gallery	1	\N	web
1977	product_images/ups-anc-850va-avr-2-output-socket_5.jpg	f	800	UPS ANC 850VA (AVR), 2 Output Socket	gallery	5	\N	web
1978	product_images/ups-anc-850va-avr-2-output-socket_7.jpg	f	800	UPS ANC 850VA (AVR), 2 Output Socket	gallery	7	\N	web
1979	product_images/cable-utp-5-dahua-dlya-vneshnih-rabot_3.jpg	f	712	Cable UTP-5 DAHUA для внешних работ	gallery	3	\N	web
1980	product_images/cable-utp-5-dahua-dlya-vneshnih-rabot_5.jpg	f	712	Cable UTP-5 DAHUA для внешних работ	gallery	5	\N	web
1981	product_images/secure-digital-card-micro-32gb_4.jpg	f	569	Secure Digital Card micro 32GB	gallery	4	\N	web
1982	product_images/cable-sata-pitanie-ii_0.jpg	t	507	Cable SATA питание II	main	0	\N	web
1983	product_images/cable-sata-pitanie-ii_1.png	f	507	Cable SATA питание II	gallery	1	\N	web
1984	product_images/cable-sata-pitanie-ii_2.jpg	f	507	Cable SATA питание II	gallery	2	\N	web
1985	product_images/keyboard-a4tech-kr-85-comfort-usb-black_3.jpg	f	596	Keyboard A4TECH KR-85 COMFORT USB BLACK	gallery	3	\N	web
1986	product_images/keyboard-a4tech-kr-85-comfort-usb-black_5.jpg	f	596	Keyboard A4TECH KR-85 COMFORT USB BLACK	gallery	5	\N	web
1987	product_images/keyboard-a4tech-kr-85-comfort-usb-black_7.jpg	f	596	Keyboard A4TECH KR-85 COMFORT USB BLACK	gallery	7	\N	web
1988	product_images/cooler-p1_0.jpg	t	547	Cooler P1	main	0	\N	web
1989	product_images/cooler-p1_1.jpg	f	547	Cooler P1	gallery	1	\N	web
1990	product_images/cooler-p1_2.jpg	f	547	Cooler P1	gallery	2	\N	web
1991	product_images/ssd-hikvision-hs-ssd-c100-240gb-tlc-25_1.jpg	f	578	SSD HIKVISION HS-SSD-C100 240GB TLC 2,5""	gallery	1	\N	web
1992	product_images/ssd-hikvision-hs-ssd-c100-240gb-tlc-25_2.jpg	f	578	SSD HIKVISION HS-SSD-C100 240GB TLC 2,5""	gallery	2	\N	web
1993	product_images/ssd-hikvision-hs-ssd-c100-240gb-tlc-25_5.jpg	f	578	SSD HIKVISION HS-SSD-C100 240GB TLC 2,5""	gallery	5	\N	web
1994	product_images/cetevoy-filtr-ekspert-3rozetki-5m_1.jpg	f	556	Cетевой фильтр Эксперт - 3розетки 5м	gallery	1	\N	web
1995	product_images/cetevoy-filtr-ekspert-3rozetki-5m_2.jpg	f	556	Cетевой фильтр Эксперт - 3розетки 5м	gallery	2	\N	web
1996	product_images/cetevoy-filtr-ekspert-3rozetki-5m_3.png	f	556	Cетевой фильтр Эксперт - 3розетки 5м	gallery	3	\N	web
1997	product_images/perehodnik-vga-na-display-port_0.jpg	t	500	Переходник VGA на Display -Port	main	0	\N	web
1998	product_images/perehodnik-vga-na-display-port_1.png	f	500	Переходник VGA на Display -Port	gallery	1	\N	web
1999	product_images/perehodnik-vga-na-display-port_4.jpg	f	500	Переходник VGA на Display -Port	gallery	4	\N	web
2000	product_images/hub-switch-tp-link-5-port-10100_0.jpg	t	723	HUB Switch TP-Link 5-port 10/100	main	0	\N	web
2001	product_images/hub-switch-tp-link-5-port-10100_1.jpg	f	723	HUB Switch TP-Link 5-port 10/100	gallery	1	\N	web
2002	product_images/hub-switch-tp-link-5-port-10100_5.jpg	f	723	HUB Switch TP-Link 5-port 10/100	gallery	5	\N	web
2003	product_images/secure-digital-card-micro-128mb_0.jpg	t	566	Secure Digital Card micro 128MB	main	0	\N	web
2004	product_images/secure-digital-card-micro-128mb_2.jpg	f	566	Secure Digital Card micro 128MB	gallery	2	\N	web
2005	product_images/secure-digital-card-micro-128mb_4.png	f	566	Secure Digital Card micro 128MB	gallery	4	\N	web
2006	product_images/cable-vga-15m_1.jpg	f	515	Cable VGA 1.5м	gallery	1	\N	web
2007	product_images/cable-vga-15m_2.jpg	f	515	Cable VGA 1.5м	gallery	2	\N	web
2008	product_images/cable-vga-15m_5.jpg	f	515	Cable VGA 1.5м	gallery	5	\N	web
2009	product_images/naushniki-sven-ap-g855mv-gaming-chernyy-krasnye_3.jpg	f	695	Наушники SVEN AP-G855MV Gaming, черный-красные	gallery	3	\N	web
2010	product_images/a4tech-bloody-q5081s-bloody-neon-xglide-gaming-mouse-q50-pad-usb-b_2.jpg	f	642	A4TECH BLOODY Q5081S BLOODY NEON X'GLIDE GAMING MOUSE Q50 + PAD USB B	gallery	2	\N	web
2011	product_images/a4tech-bloody-q5081s-bloody-neon-xglide-gaming-mouse-q50-pad-usb-b_5.jpg	f	642	A4TECH BLOODY Q5081S BLOODY NEON X'GLIDE GAMING MOUSE Q50 + PAD USB B	gallery	5	\N	web
2012	product_images/wireless-router-tp-link-tl-wr840n-wi-fi-300-mb-4-lan-100-mb_0.jpg	t	737	Wireless Router TP-LINK TL-WR840N Wi-Fi 300 Мб, 4 LAN 100 Мб	main	0	\N	web
2013	product_images/wireless-router-tp-link-tl-wr840n-wi-fi-300-mb-4-lan-100-mb_1.jpg	f	737	Wireless Router TP-LINK TL-WR840N Wi-Fi 300 Мб, 4 LAN 100 Мб	gallery	1	\N	web
2014	product_images/wireless-router-tp-link-tl-wr840n-wi-fi-300-mb-4-lan-100-mb_2.jpg	f	737	Wireless Router TP-LINK TL-WR840N Wi-Fi 300 Мб, 4 LAN 100 Мб	gallery	2	\N	web
2015	product_images/cpu-lga1700-intel-core-i5-12400-lga1700-250-440ghz-6xcores_1.png	f	770	CPU LGA1700 Intel Core i5-12400, LGA1700 2.50-4.40GHz, 6xCores	gallery	1	\N	web
2016	product_images/cpu-lga1700-intel-core-i5-12400-lga1700-250-440ghz-6xcores_2.jpg	f	770	CPU LGA1700 Intel Core i5-12400, LGA1700 2.50-4.40GHz, 6xCores	gallery	2	\N	web
2017	product_images/cpu-lga1700-intel-core-i5-12400-lga1700-250-440ghz-6xcores_3.jpg	f	770	CPU LGA1700 Intel Core i5-12400, LGA1700 2.50-4.40GHz, 6xCores	gallery	3	\N	web
2018	product_images/korpus-aerocool-viewport-mini-g-bk-v1-micro-atxmini-itx-usb-3022_0.jpg	t	540	Корпус Aerocool Viewport Mini-G-BK-v1, Micro ATX/mini-ITX, USB 3.0/2*2	main	0	\N	web
2019	product_images/korpus-aerocool-viewport-mini-g-bk-v1-micro-atxmini-itx-usb-3022_1.jpg	f	540	Корпус Aerocool Viewport Mini-G-BK-v1, Micro ATX/mini-ITX, USB 3.0/2*2	gallery	1	\N	web
2104	product_images/microlab-subwoofer-m-105r-21-10w-5w25w2-black_8.jpg	f	775	Microlab Subwoofer M-105R 2.1 10W (5W+2.5W*2) BLACK	gallery	8	\N	web
2020	product_images/korpus-aerocool-viewport-mini-g-bk-v1-micro-atxmini-itx-usb-3022_6.jpg	f	540	Корпус Aerocool Viewport Mini-G-BK-v1, Micro ATX/mini-ITX, USB 3.0/2*2	gallery	6	\N	web
2021	product_images/dvdrwcdrw-22x-black-sata-dlya-tendera_2.jpg	f	543	DVD±RW&CDRW 22X Black SATA - для тендера	gallery	2	\N	web
2022	product_images/dvdrwcdrw-22x-black-sata-dlya-tendera_5.jpg	f	543	DVD±RW&CDRW 22X Black SATA - для тендера	gallery	5	\N	web
2023	product_images/microlab-subwoofer-m-300u-21-black-40w20w210w_1.png	f	782	Microlab Subwoofer M-300U 2.1 BLACK 40W(20W+2*10W)	gallery	1	\N	web
2024	product_images/microlab-subwoofer-m-300u-21-black-40w20w210w_2.jpg	f	782	Microlab Subwoofer M-300U 2.1 BLACK 40W(20W+2*10W)	gallery	2	\N	web
2025	product_images/microlab-subwoofer-m-300u-21-black-40w20w210w_3.webp	f	782	Microlab Subwoofer M-300U 2.1 BLACK 40W(20W+2*10W)	gallery	3	\N	web
2026	product_images/gigabyte-h610m-kn-ddr4-lga1700-intel-h610-2xddr4-pc25600_1.jpg	f	610	Gigabyte H610M K\\Н DDR4, LGA1700, Intel H610, 2xDDR4 PC25600,	gallery	1	\N	web
2027	product_images/gigabyte-h610m-kn-ddr4-lga1700-intel-h610-2xddr4-pc25600_3.jpg	f	610	Gigabyte H610M K\\Н DDR4, LGA1700, Intel H610, 2xDDR4 PC25600,	gallery	3	\N	web
2028	product_images/gigabyte-h610m-kn-ddr4-lga1700-intel-h610-2xddr4-pc25600_4.jpg	f	610	Gigabyte H610M K\\Н DDR4, LGA1700, Intel H610, 2xDDR4 PC25600,	gallery	4	\N	web
2029	product_images/sumka-dlya-tsifrovoy-kamery-sredne-dorogie_0.webp	t	869	Сумка для цифровой камеры средне-дорогие	main	0	\N	web
2030	product_images/sumka-dlya-tsifrovoy-kamery-sredne-dorogie_1.webp	f	869	Сумка для цифровой камеры средне-дорогие	gallery	1	\N	web
2031	product_images/sumka-dlya-tsifrovoy-kamery-sredne-dorogie_2.webp	f	869	Сумка для цифровой камеры средне-дорогие	gallery	2	\N	web
2032	product_images/kabel-usb-c-hdmi-15-m-ugreen-mm142_0.jpg	t	532	Кабель USB-C - HDMI 1.5 m UGREEN MM142	main	0	\N	web
2033	product_images/kabel-usb-c-hdmi-15-m-ugreen-mm142_6.jpg	f	532	Кабель USB-C - HDMI 1.5 m UGREEN MM142	gallery	6	\N	web
2034	product_images/kabel-usb-c-hdmi-15-m-ugreen-mm142_8.webp	f	532	Кабель USB-C - HDMI 1.5 m UGREEN MM142	gallery	8	\N	web
2035	product_images/acer-nitro-v-anv15-52-74y5-i7-13620h32gb-ddr4-1tb-ssd-m2-nvme-156_1.jpg	f	748	Acer NITRO V ANV15-52-74Y5 i7-13620H\\32GB DDR4\\ 1TB SSD m2 NVMe, 15.6"	gallery	1	\N	web
2036	product_images/acer-nitro-v-anv15-52-74y5-i7-13620h32gb-ddr4-1tb-ssd-m2-nvme-156_3.jpg	f	748	Acer NITRO V ANV15-52-74Y5 i7-13620H\\32GB DDR4\\ 1TB SSD m2 NVMe, 15.6"	gallery	3	\N	web
2037	product_images/acer-nitro-v-anv15-52-74y5-i7-13620h32gb-ddr4-1tb-ssd-m2-nvme-156_4.jpg	f	748	Acer NITRO V ANV15-52-74Y5 i7-13620H\\32GB DDR4\\ 1TB SSD m2 NVMe, 15.6"	gallery	4	\N	web
2038	product_images/samsung-galaxy-tab-a11-x236-11-6128-gb_2.jpg	f	837	Samsung Galaxy Tab A11+ (X236) 11" 6/128 GB	gallery	2	\N	web
2039	product_images/samsung-galaxy-tab-a11-x236-11-6128-gb_3.png	f	837	Samsung Galaxy Tab A11+ (X236) 11" 6/128 GB	gallery	3	\N	web
2040	product_images/samsung-galaxy-tab-a11-x236-11-6128-gb_5.jpg	f	837	Samsung Galaxy Tab A11+ (X236) 11" 6/128 GB	gallery	5	\N	web
2041	product_images/hub-hikvision-5-port-101001000_2.png	f	719	HUB HIKVISION 5-port 10/100/1000	gallery	2	\N	web
2042	product_images/hub-hikvision-5-port-101001000_3.jpg	f	719	HUB HIKVISION 5-port 10/100/1000	gallery	3	\N	web
2043	product_images/hub-hikvision-5-port-101001000_6.jpg	f	719	HUB HIKVISION 5-port 10/100/1000	gallery	6	\N	web
2044	product_images/secure-digital-card-micro-512mb_4.jpg	f	570	Secure Digital Card micro 512MB	gallery	4	\N	web
2045	product_images/speakers-microlab-b-23-6w-20-usb_2.jpg	f	789	Speakers Microlab B-23 6W 2.0 USB	gallery	2	\N	web
2046	product_images/speakers-microlab-b-23-6w-20-usb_5.jpg	f	789	Speakers Microlab B-23 6W 2.0 USB	gallery	5	\N	web
2047	product_images/speakers-microlab-b-23-6w-20-usb_6.jpg	f	789	Speakers Microlab B-23 6W 2.0 USB	gallery	6	\N	web
2048	product_images/konvertor-hdmi-to-vga-so-zvukom_1.png	f	499	Конвертор HDMI to VGA со звуком	gallery	1	\N	web
2049	product_images/konvertor-hdmi-to-vga-so-zvukom_2.png	f	499	Конвертор HDMI to VGA со звуком	gallery	2	\N	web
2050	product_images/konvertor-hdmi-to-vga-so-zvukom_6.jpg	f	499	Конвертор HDMI to VGA со звуком	gallery	6	\N	web
2051	product_images/a4tech-kr-9276-kr-92op-760-keyboardmouse-set-usb-black-usrussian_1.png	f	593	A4TECH KR-9276 (KR-92+OP-760) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	1	\N	web
2052	product_images/a4tech-kr-9276-kr-92op-760-keyboardmouse-set-usb-black-usrussian_6.jpg	f	593	A4TECH KR-9276 (KR-92+OP-760) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	6	\N	web
2053	product_images/a4tech-kr-9276-kr-92op-760-keyboardmouse-set-usb-black-usrussian_7.jpg	f	593	A4TECH KR-9276 (KR-92+OP-760) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	7	\N	web
2054	product_images/konverter-dvi-to-hdmi_0.jpg	t	498	конвертер DVI to HDMI	main	0	\N	web
2055	product_images/konverter-dvi-to-hdmi_1.jpg	f	498	конвертер DVI to HDMI	gallery	1	\N	web
2056	product_images/konverter-dvi-to-hdmi_2.jpg	f	498	конвертер DVI to HDMI	gallery	2	\N	web
2057	product_images/mouse-a4tech-g7-350n-v-track-padless-wireless-mouse-usb-titan-gray_0.png	t	661	Mouse A4TECH G7-350N V-TRACK PADLESS WIRELESS MOUSE USB TITAN GRAY	main	0	\N	web
2058	product_images/mouse-a4tech-g7-350n-v-track-padless-wireless-mouse-usb-titan-gray_7.png	f	661	Mouse A4TECH G7-350N V-TRACK PADLESS WIRELESS MOUSE USB TITAN GRAY	gallery	7	\N	web
2059	product_images/kreslo-krutyaschiesya-s-otkidnoy-prozrachnoy-spinkoy-setka-855-chern_0.jpg	t	822	Кресло крутящиеся - с откидной прозрачной спинкой -сетка 855 - черн	main	0	\N	web
2060	product_images/kreslo-krutyaschiesya-s-otkidnoy-prozrachnoy-spinkoy-setka-855-chern_1.jpg	f	822	Кресло крутящиеся - с откидной прозрачной спинкой -сетка 855 - черн	gallery	1	\N	web
2061	product_images/kreslo-krutyaschiesya-s-otkidnoy-prozrachnoy-spinkoy-setka-855-chern_2.jpg	f	822	Кресло крутящиеся - с откидной прозрачной спинкой -сетка 855 - черн	gallery	2	\N	web
2062	product_images/gigabyte-h610m-h-v2-ddr5-lga1700-intel-h610-2xddr5-pc25600-1xpci-e_0.jpg	t	609	Gigabyte H610M H V2 DDR5, LGA1700, Intel H610, 2xDDR5 PC25600, 1xPCI-E	main	0	\N	web
2063	product_images/gigabyte-h610m-h-v2-ddr5-lga1700-intel-h610-2xddr5-pc25600-1xpci-e_1.png	f	609	Gigabyte H610M H V2 DDR5, LGA1700, Intel H610, 2xDDR5 PC25600, 1xPCI-E	gallery	1	\N	web
2064	product_images/gigabyte-h610m-h-v2-ddr5-lga1700-intel-h610-2xddr5-pc25600-1xpci-e_4.jpg	f	609	Gigabyte H610M H V2 DDR5, LGA1700, Intel H610, 2xDDR5 PC25600, 1xPCI-E	gallery	4	\N	web
2065	product_images/hub-hikvision-5-port-10100_1.jpg	f	718	HUB HIKVISION 5-port 10/100	gallery	1	\N	web
2066	product_images/hub-hikvision-5-port-10100_3.jpg	f	718	HUB HIKVISION 5-port 10/100	gallery	3	\N	web
2067	product_images/hub-hikvision-5-port-10100_6.jpg	f	718	HUB HIKVISION 5-port 10/100	gallery	6	\N	web
2068	product_images/cable-vga-5m_0.jpg	t	519	Cable VGA 5м	main	0	\N	web
2069	product_images/cable-vga-5m_1.jpg	f	519	Cable VGA 5м	gallery	1	\N	web
2070	product_images/cable-vga-5m_2.jpg	f	519	Cable VGA 5м	gallery	2	\N	web
2071	product_images/blok-pitaniya-ot-modema-5v-2a_0.jpg	t	846	Блок питания от модема 5V / 2А	main	0	\N	web
2072	product_images/blok-pitaniya-ot-modema-5v-2a_1.jpg	f	846	Блок питания от модема 5V / 2А	gallery	1	\N	web
2073	product_images/blok-pitaniya-ot-modema-5v-2a_2.jpg	f	846	Блок питания от модема 5V / 2А	gallery	2	\N	web
2074	product_images/mouse-winstar-razeak-rm-x18-gaming_0.jpg	t	673	Mouse Winstar Razeak RM-X18 Gaming	main	0	\N	web
2075	product_images/mouse-winstar-razeak-rm-x18-gaming_1.jpg	f	673	Mouse Winstar Razeak RM-X18 Gaming	gallery	1	\N	web
2076	product_images/mouse-winstar-razeak-rm-x18-gaming_4.jpg	f	673	Mouse Winstar Razeak RM-X18 Gaming	gallery	4	\N	web
2077	product_images/delux-m138bu-optical-black-colorusb-cable-1000-dpi_1.jpg	f	656	Delux M138BU Optical black color,USB cable, 1000 DPI	gallery	1	\N	web
2078	product_images/delux-m138bu-optical-black-colorusb-cable-1000-dpi_7.jpg	f	656	Delux M138BU Optical black color,USB cable, 1000 DPI	gallery	7	\N	web
2079	product_images/delux-m138bu-optical-black-colorusb-cable-1000-dpi_8.jpg	f	656	Delux M138BU Optical black color,USB cable, 1000 DPI	gallery	8	\N	web
2080	product_images/ssd-128gb-foresee-m2-2280-nvme_1.jpg	f	581	SSD 128GB FORESEE M.2 2280 NVME	gallery	1	\N	web
2081	product_images/ssd-128gb-foresee-m2-2280-nvme_2.jpg	f	581	SSD 128GB FORESEE M.2 2280 NVME	gallery	2	\N	web
2082	product_images/ssd-128gb-foresee-m2-2280-nvme_3.jpg	f	581	SSD 128GB FORESEE M.2 2280 NVME	gallery	3	\N	web
2083	product_images/sumka-dlya-noutbuka-rivacase-8035-black-156_0.jpg	t	863	Сумка для ноутбука RivaCase 8035 Black 15,6"	main	0	\N	web
2084	product_images/sumka-dlya-noutbuka-rivacase-8035-black-156_2.jpg	f	863	Сумка для ноутбука RivaCase 8035 Black 15,6"	gallery	2	\N	web
2085	product_images/sumka-dlya-noutbuka-rivacase-8035-black-156_4.jpg	f	863	Сумка для ноутбука RivaCase 8035 Black 15,6"	gallery	4	\N	web
2086	product_images/nastennyy-kronshteyn-dlya-tv-i-monitorov-42-65-dyuymov-45-kg_6.jpg	f	818	Настенный кронштейн для ТВ и мониторов 42-65 дюймов - 45 кг	gallery	6	\N	web
2087	product_images/nastennyy-kronshteyn-dlya-tv-i-monitorov-42-65-dyuymov-45-kg_7.jpg	f	818	Настенный кронштейн для ТВ и мониторов 42-65 дюймов - 45 кг	gallery	7	\N	web
2088	product_images/amortizatory_1.png	f	820	Амортизаторы	gallery	1	\N	web
2089	product_images/amortizatory_2.jpg	f	820	Амортизаторы	gallery	2	\N	web
2090	product_images/amortizatory_4.jpg	f	820	Амортизаторы	gallery	4	\N	web
2091	product_images/pad-rubber-s-kartinkoy-microsoft-big-40h90_0.jpg	t	679	Pad rubber с картинкой \\ microsoft BIG 40х90	main	0	\N	web
2092	product_images/pad-rubber-s-kartinkoy-microsoft-big-40h90_1.jpg	f	679	Pad rubber с картинкой \\ microsoft BIG 40х90	gallery	1	\N	web
2093	product_images/pad-rubber-s-kartinkoy-microsoft-big-40h90_2.jpg	f	679	Pad rubber с картинкой \\ microsoft BIG 40х90	gallery	2	\N	web
2094	product_images/dtech-audiorazvetvitel-t0222-cable-l025m_0.jpg	t	493	DTECH аудиоразветвитель T0222 cable L=0.25m	main	0	\N	web
2095	product_images/dtech-audiorazvetvitel-t0222-cable-l025m_1.jpg	f	493	DTECH аудиоразветвитель T0222 cable L=0.25m	gallery	1	\N	web
2096	product_images/dtech-audiorazvetvitel-t0222-cable-l025m_2.jpg	f	493	DTECH аудиоразветвитель T0222 cable L=0.25m	gallery	2	\N	web
2097	product_images/wireless-keyboard-a4tec-4200n-gk-92g3-220n-keyboardmouse-set-usb-b_1.jpg	f	600	WIRELESS Keyboard A4Tec 4200N (GK-92+G3-220N) KEYBOARD+MOUSE SET USB B	gallery	1	\N	web
2098	product_images/wireless-keyboard-a4tec-4200n-gk-92g3-220n-keyboardmouse-set-usb-b_3.jpg	f	600	WIRELESS Keyboard A4Tec 4200N (GK-92+G3-220N) KEYBOARD+MOUSE SET USB B	gallery	3	\N	web
2099	product_images/wireless-keyboard-a4tec-4200n-gk-92g3-220n-keyboardmouse-set-usb-b_5.jpg	f	600	WIRELESS Keyboard A4Tec 4200N (GK-92+G3-220N) KEYBOARD+MOUSE SET USB B	gallery	5	\N	web
2100	product_images/kabel-hdmi-hdmi-3-m_0.jpg	t	530	Кабель HDMI - HDMI 3 m	main	0	\N	web
2101	product_images/kabel-hdmi-hdmi-3-m_2.jpg	f	530	Кабель HDMI - HDMI 3 m	gallery	2	\N	web
2102	product_images/kabel-hdmi-hdmi-3-m_3.jpg	f	530	Кабель HDMI - HDMI 3 m	gallery	3	\N	web
2103	product_images/microlab-subwoofer-m-105r-21-10w-5w25w2-black_4.jpg	f	775	Microlab Subwoofer M-105R 2.1 10W (5W+2.5W*2) BLACK	gallery	4	\N	web
2105	product_images/a4tech-x77-oscar-neon-maze-2400-dpi-game-mouse-usb-black_0.webp	t	654	A4TECH X77 OSCAR NEON MAZE 2400 DPI GAME MOUSE USB BLACK	main	0	\N	web
2106	product_images/a4tech-x77-oscar-neon-maze-2400-dpi-game-mouse-usb-black_1.jpg	f	654	A4TECH X77 OSCAR NEON MAZE 2400 DPI GAME MOUSE USB BLACK	gallery	1	\N	web
2107	product_images/a4tech-x77-oscar-neon-maze-2400-dpi-game-mouse-usb-black_6.jpg	f	654	A4TECH X77 OSCAR NEON MAZE 2400 DPI GAME MOUSE USB BLACK	gallery	6	\N	web
2108	product_images/ssd-hikvision-e3000std-256gb-3d-nand-m2_0.jpg	t	576	SSD HIKVISION E3000(STD) 256GB 3D NAND M.2	main	0	\N	web
2109	product_images/ssd-hikvision-e3000std-256gb-3d-nand-m2_1.jpg	f	576	SSD HIKVISION E3000(STD) 256GB 3D NAND M.2	gallery	1	\N	web
2110	product_images/ssd-hikvision-e3000std-256gb-3d-nand-m2_3.jpg	f	576	SSD HIKVISION E3000(STD) 256GB 3D NAND M.2	gallery	3	\N	web
2111	product_images/psu-jump-atx-520-p4-total-500w-24pin4p1fdd3sata2ata-shield_0.jpg	t	759	PSU Jump ATX 520-P4 (total 500W) 24PIN+4P+1FDD+3SATA+2ATA, Shield	main	0	\N	web
2112	product_images/psu-jump-atx-520-p4-total-500w-24pin4p1fdd3sata2ata-shield_1.jpg	f	759	PSU Jump ATX 520-P4 (total 500W) 24PIN+4P+1FDD+3SATA+2ATA, Shield	gallery	1	\N	web
2113	product_images/psu-jump-atx-520-p4-total-500w-24pin4p1fdd3sata2ata-shield_2.jpg	f	759	PSU Jump ATX 520-P4 (total 500W) 24PIN+4P+1FDD+3SATA+2ATA, Shield	gallery	2	\N	web
2114	product_images/a4tech-bloody-b135n-gaming-neon-backlight-multimedia-keyboard-usb_4.jpg	f	589	A4TECH BLOODY B135N GAMING NEON BACKLIGHT MULTIMEDIA KEYBOARD USB	gallery	4	\N	web
2115	product_images/a4tech-bloody-b135n-gaming-neon-backlight-multimedia-keyboard-usb_5.jpg	f	589	A4TECH BLOODY B135N GAMING NEON BACKLIGHT MULTIMEDIA KEYBOARD USB	gallery	5	\N	web
2116	product_images/a4tech-bloody-b135n-gaming-neon-backlight-multimedia-keyboard-usb_7.jpg	f	589	A4TECH BLOODY B135N GAMING NEON BACKLIGHT MULTIMEDIA KEYBOARD USB	gallery	7	\N	web
2117	product_images/a4tech-bloody-q81-neon-xglide-gaming-mouse-usb-curve_2.png	f	643	A4TECH BLOODY Q81 NEON X'GLIDE GAMING MOUSE USB CURVE	gallery	2	\N	web
2118	product_images/a4tech-bloody-q81-neon-xglide-gaming-mouse-usb-curve_5.jpg	f	643	A4TECH BLOODY Q81 NEON X'GLIDE GAMING MOUSE USB CURVE	gallery	5	\N	web
2119	product_images/a4tech-bloody-q81-neon-xglide-gaming-mouse-usb-curve_6.jpg	f	643	A4TECH BLOODY Q81 NEON X'GLIDE GAMING MOUSE USB CURVE	gallery	6	\N	web
2120	product_images/a4tech-op-330-optical-mouse-usb-black_1.png	f	635	A4TECH OP-330 OPTICAL MOUSE USB BLACK	gallery	1	\N	web
2121	product_images/a4tech-op-330-optical-mouse-usb-black_6.jpg	f	635	A4TECH OP-330 OPTICAL MOUSE USB BLACK	gallery	6	\N	web
2122	product_images/a4tech-op-330-optical-mouse-usb-black_8.jpg	f	635	A4TECH OP-330 OPTICAL MOUSE USB BLACK	gallery	8	\N	web
2123	product_images/cooler-for-psucase-deepcool-rf120-blue-led_0.webp	t	546	Cooler for PSU/CASE DEEPCOOL RF120 BLUE LED	main	0	\N	web
2124	product_images/cooler-for-psucase-deepcool-rf120-blue-led_4.jpg	f	546	Cooler for PSU/CASE DEEPCOOL RF120 BLUE LED	gallery	4	\N	web
2125	product_images/cooler-for-psucase-deepcool-rf120-blue-led_6.jpg	f	546	Cooler for PSU/CASE DEEPCOOL RF120 BLUE LED	gallery	6	\N	web
2126	product_images/naushniki-s-mikrofonom-a4tech-fstyler-fh300u-neon-usb-black_2.jpg	f	701	Наушники с микрофоном A4Tech FSTYLER FH300U NEON USB BLACK	gallery	2	\N	web
2127	product_images/naushniki-s-mikrofonom-a4tech-fstyler-fh300u-neon-usb-black_5.jpg	f	701	Наушники с микрофоном A4Tech FSTYLER FH300U NEON USB BLACK	gallery	5	\N	web
2128	product_images/naushniki-s-mikrofonom-a4tech-fstyler-fh300u-neon-usb-black_6.jpg	f	701	Наушники с микрофоном A4Tech FSTYLER FH300U NEON USB BLACK	gallery	6	\N	web
2129	product_images/wireless-router-tp-link-archer-c54ru-ac1200-dual-band-wi-fi-867mbs_0.jpg	t	736	Wireless Router TP-LINK Archer C54(RU) AC1200 Dual-Band Wi-Fi, 867Mb/s	main	0	\N	web
2130	product_images/wireless-router-tp-link-archer-c54ru-ac1200-dual-band-wi-fi-867mbs_1.jpg	f	736	Wireless Router TP-LINK Archer C54(RU) AC1200 Dual-Band Wi-Fi, 867Mb/s	gallery	1	\N	web
2131	product_images/wireless-router-tp-link-archer-c54ru-ac1200-dual-band-wi-fi-867mbs_2.jpg	f	736	Wireless Router TP-LINK Archer C54(RU) AC1200 Dual-Band Wi-Fi, 867Mb/s	gallery	2	\N	web
2132	product_images/naushniki-s-mikrofonom-edifier-w800bt-se-bluetooth-54_3.webp	f	704	Наушники с микрофоном Edifier W800BT SE Bluetooth 5.4	gallery	3	\N	web
2133	product_images/klaviatura-mysh-kovrik-sven-gs-9200-igrovaya-cherno-krasnaya_7.png	f	603	Клавиатура +мышь + коврик SVEN GS- 9200 игровая черно-красная	gallery	7	\N	web
2134	product_images/a4tech-op-620-optical-mouse-usb-black_0.jpg	t	637	A4TECH OP-620 OPTICAL MOUSE USB BLACK	main	0	\N	web
2135	product_images/a4tech-op-620-optical-mouse-usb-black_1.jpg	f	637	A4TECH OP-620 OPTICAL MOUSE USB BLACK	gallery	1	\N	web
2136	product_images/a4tech-op-620-optical-mouse-usb-black_3.jpg	f	637	A4TECH OP-620 OPTICAL MOUSE USB BLACK	gallery	3	\N	web
2137	product_images/invertor-svc-dil-1200-1000w-vhod-12v-iili-220v-vyhod-220v-chista_0.jpg	t	804	Инвертор SVC DIL-1200 (1000W), Вход 12В и/или 220В, Выход 220В, (Чиста	main	0	\N	web
2138	product_images/invertor-svc-dil-1200-1000w-vhod-12v-iili-220v-vyhod-220v-chista_7.jpg	f	804	Инвертор SVC DIL-1200 (1000W), Вход 12В и/или 220В, Выход 220В, (Чиста	gallery	7	\N	web
2139	product_images/invertor-svc-dil-1200-1000w-vhod-12v-iili-220v-vyhod-220v-chista_8.jpg	f	804	Инвертор SVC DIL-1200 (1000W), Вход 12В и/или 220В, Выход 220В, (Чиста	gallery	8	\N	web
2140	product_images/power-unit-winstar-atx-700-700w-80-plus-bronze_0.png	t	758	Power Unit WINSTAR ATX-700 700W 80 PLUS Bronze	main	0	\N	web
2141	product_images/power-unit-winstar-atx-700-700w-80-plus-bronze_1.jpg	f	758	Power Unit WINSTAR ATX-700 700W 80 PLUS Bronze	gallery	1	\N	web
2142	product_images/power-unit-winstar-atx-700-700w-80-plus-bronze_2.png	f	758	Power Unit WINSTAR ATX-700 700W 80 PLUS Bronze	gallery	2	\N	web
2264	product_images/stul-ofisnyy-prostoy_3.jpg	f	831	Стул офисный - простой	gallery	3	\N	web
2143	product_images/power-unit-delux-dlp-23d-280w330a204pin2sata3big-4pin1small-4_0.jpg	t	755	Power Unit DELUX DLP-23D 280W(330A)20+4PIN,2*SATA,3*big 4pin,1*small 4	main	0	\N	web
2144	product_images/power-unit-delux-dlp-23d-280w330a204pin2sata3big-4pin1small-4_2.jpg	f	755	Power Unit DELUX DLP-23D 280W(330A)20+4PIN,2*SATA,3*big 4pin,1*small 4	gallery	2	\N	web
2145	product_images/power-unit-delux-dlp-23d-280w330a204pin2sata3big-4pin1small-4_3.jpg	f	755	Power Unit DELUX DLP-23D 280W(330A)20+4PIN,2*SATA,3*big 4pin,1*small 4	gallery	3	\N	web
2146	product_images/a4tech-op-720-optical-mouse-usb-black_1.jpg	f	638	A4TECH OP-720 OPTICAL MOUSE USB BLACK	gallery	1	\N	web
2147	product_images/a4tech-op-720-optical-mouse-usb-black_6.jpg	f	638	A4TECH OP-720 OPTICAL MOUSE USB BLACK	gallery	6	\N	web
2148	product_images/a4tech-op-720-optical-mouse-usb-black_7.jpg	f	638	A4TECH OP-720 OPTICAL MOUSE USB BLACK	gallery	7	\N	web
2149	product_images/naushniki-somic-g926-igrovye_1.jpg	f	692	Наушники "SOMiC" G926 игровые	gallery	1	\N	web
2150	product_images/naushniki-somic-g926-igrovye_4.jpg	f	692	Наушники "SOMiC" G926 игровые	gallery	4	\N	web
2151	product_images/naushniki-somic-g926-igrovye_5.jpg	f	692	Наушники "SOMiC" G926 игровые	gallery	5	\N	web
2152	product_images/ups-svc-650va-l-lcd_3.jpg	f	803	UPS SVC 650VA - L - LCD	gallery	3	\N	web
2153	product_images/ups-svc-650va-l-lcd_6.jpg	f	803	UPS SVC 650VA - L - LCD	gallery	6	\N	web
2154	product_images/besprovodnoy-marshrutizator-wi-fi-cudy-wr1300-ac1200-gigabit-mesh_1.webp	f	739	Беспроводной маршрутизатор Wi-Fi CUDY WR1300 AC1200 Gigabit Mesh	gallery	1	\N	web
2155	product_images/besprovodnoy-marshrutizator-wi-fi-cudy-wr1300-ac1200-gigabit-mesh_2.jpg	f	739	Беспроводной маршрутизатор Wi-Fi CUDY WR1300 AC1200 Gigabit Mesh	gallery	2	\N	web
2156	product_images/besprovodnoy-marshrutizator-wi-fi-cudy-wr1300-ac1200-gigabit-mesh_3.jpg	f	739	Беспроводной маршрутизатор Wi-Fi CUDY WR1300 AC1200 Gigabit Mesh	gallery	3	\N	web
2157	product_images/dvd-pod-hdd-slim-sata-dlya-noutbukov-vmesto-dvd-9mm-sa_0.jpg	t	494	DVD под HDD SLIM SATA (для ноутбуков вместо DVD 9mm SA)	main	0	\N	web
2158	product_images/dvd-pod-hdd-slim-sata-dlya-noutbukov-vmesto-dvd-9mm-sa_3.jpg	f	494	DVD под HDD SLIM SATA (для ноутбуков вместо DVD 9mm SA)	gallery	3	\N	web
2159	product_images/dvd-pod-hdd-slim-sata-dlya-noutbukov-vmesto-dvd-9mm-sa_5.jpg	f	494	DVD под HDD SLIM SATA (для ноутбуков вместо DVD 9mm SA)	gallery	5	\N	web
2160	product_images/provod-dlya-noutbuka-3-dyrki_0.webp	t	535	Провод для ноутбука 3 дырки	main	0	\N	web
2161	product_images/provod-dlya-noutbuka-3-dyrki_1.jpg	f	535	Провод для ноутбука 3 дырки	gallery	1	\N	web
2162	product_images/provod-dlya-noutbuka-3-dyrki_2.jpg	f	535	Провод для ноутбука 3 дырки	gallery	2	\N	web
2163	product_images/pen-drive-64gb-usb-303132_1.jpg	f	565	PEN DRIVE 64GB USB 3.0\\3.1\\3,2	gallery	1	\N	web
2164	product_images/pen-drive-64gb-usb-303132_2.jpg	f	565	PEN DRIVE 64GB USB 3.0\\3.1\\3,2	gallery	2	\N	web
2165	product_images/pen-drive-64gb-usb-303132_3.jpg	f	565	PEN DRIVE 64GB USB 3.0\\3.1\\3,2	gallery	3	\N	web
2166	product_images/wi-fi-cudy-wu300-ax300-286mbps-wi-fi-usb-adapter-mini-size286mbps-at_0.png	t	728	Wi-Fi CUDY WU300 AX300 286Mbps Wi-Fi USB Adapter, Mini Size,286Mbps at	main	0	\N	web
2167	product_images/wi-fi-cudy-wu300-ax300-286mbps-wi-fi-usb-adapter-mini-size286mbps-at_1.png	f	728	Wi-Fi CUDY WU300 AX300 286Mbps Wi-Fi USB Adapter, Mini Size,286Mbps at	gallery	1	\N	web
2168	product_images/wi-fi-cudy-wu300-ax300-286mbps-wi-fi-usb-adapter-mini-size286mbps-at_2.webp	f	728	Wi-Fi CUDY WU300 AX300 286Mbps Wi-Fi USB Adapter, Mini Size,286Mbps at	gallery	2	\N	web
2169	product_images/hub-switch-tenda-5-port-101001000_0.jpg	t	722	HUB Switch Tenda 5-port 10/100\\1000	main	0	\N	web
2170	product_images/hub-switch-tenda-5-port-101001000_1.jpg	f	722	HUB Switch Tenda 5-port 10/100\\1000	gallery	1	\N	web
2171	product_images/hub-switch-tenda-5-port-101001000_3.jpg	f	722	HUB Switch Tenda 5-port 10/100\\1000	gallery	3	\N	web
2172	product_images/a4tech-fstyler-fg10-optical-mouse-wireless-1200dpi-black_3.jpg	f	646	A4TECH FSTYLER FG10 OPTICAL MOUSE WIRELESS 1200DPI BLACK	gallery	3	\N	web
2173	product_images/a4tech-fstyler-fg10-optical-mouse-wireless-1200dpi-black_4.jpg	f	646	A4TECH FSTYLER FG10 OPTICAL MOUSE WIRELESS 1200DPI BLACK	gallery	4	\N	web
2174	product_images/a4tech-fstyler-fg10-optical-mouse-wireless-1200dpi-black_5.jpg	f	646	A4TECH FSTYLER FG10 OPTICAL MOUSE WIRELESS 1200DPI BLACK	gallery	5	\N	web
2175	product_images/sumka-dlya-noutbuka-rivacase-8065-blackkhaki-156_4.jpg	f	865	Сумка для ноутбука RivaCase 8065 Black\\Khaki 15,6"	gallery	4	\N	web
2176	product_images/hub-switch-tp-link-8-port-10100_1.jpg	f	725	HUB Switch TP-Link 8-port 10/100	gallery	1	\N	web
2177	product_images/hub-switch-tp-link-8-port-10100_3.jpg	f	725	HUB Switch TP-Link 8-port 10/100	gallery	3	\N	web
2178	product_images/hub-switch-tp-link-8-port-10100_4.jpg	f	725	HUB Switch TP-Link 8-port 10/100	gallery	4	\N	web
2179	product_images/splitter-setevoy-rj45-ugreen-cm-210_0.jpg	t	744	Сплиттер сетевой RJ45 UGREEN CM 210	main	0	\N	web
2180	product_images/splitter-setevoy-rj45-ugreen-cm-210_2.jpg	f	744	Сплиттер сетевой RJ45 UGREEN CM 210	gallery	2	\N	web
2181	product_images/splitter-setevoy-rj45-ugreen-cm-210_5.jpg	f	744	Сплиттер сетевой RJ45 UGREEN CM 210	gallery	5	\N	web
2182	product_images/antivirus-drweb-security-space-1pk-1god_1.png	f	809	Антивирус Dr.Web Security Space 1пк \\ 1год	gallery	1	\N	web
2183	product_images/antivirus-drweb-security-space-1pk-1god_7.jpg	f	809	Антивирус Dr.Web Security Space 1пк \\ 1год	gallery	7	\N	web
2184	product_images/naushniki-s-mikrofonom-genius-hs-g710v-dugovye-usb-20hz-20khz-110db_0.jpg	t	707	Наушники с микрофоном Genius HS-G710V, Дуговые, USB, 20Hz-20kHz, 110dB	main	0	\N	web
2185	product_images/naushniki-s-mikrofonom-genius-hs-g710v-dugovye-usb-20hz-20khz-110db_1.jpg	f	707	Наушники с микрофоном Genius HS-G710V, Дуговые, USB, 20Hz-20kHz, 110dB	gallery	1	\N	web
2186	product_images/naushniki-s-mikrofonom-genius-hs-g710v-dugovye-usb-20hz-20khz-110db_3.jpg	f	707	Наушники с микрофоном Genius HS-G710V, Дуговые, USB, 20Hz-20kHz, 110dB	gallery	3	\N	web
2187	product_images/cpu-cooler-deepcool-theta-15-1700_2.jpg	f	551	CPU cooler DEEPCOOL THETA-15 1700	gallery	2	\N	web
2188	product_images/kovrik-dlya-myshki-a4tech-bloody-b-088s-professional-x-thin-igrovoy_2.jpg	f	683	Коврик для мышки A4Tech Bloody B-088S PROFESSIONAL X-THIN игровой	gallery	2	\N	web
2189	product_images/kovrik-dlya-myshki-a4tech-bloody-b-088s-professional-x-thin-igrovoy_4.jpg	f	683	Коврик для мышки A4Tech Bloody B-088S PROFESSIONAL X-THIN игровой	gallery	4	\N	web
2190	product_images/kovrik-dlya-myshki-a4tech-bloody-b-088s-professional-x-thin-igrovoy_5.jpg	f	683	Коврик для мышки A4Tech Bloody B-088S PROFESSIONAL X-THIN игровой	gallery	5	\N	web
2191	product_images/sumka-dlya-noutbuka-rivacase-7760-156-sportivnyy_2.jpg	f	855	Сумка для ноутбука RivaCase 7760 15.6" спортивный.	gallery	2	\N	web
2192	product_images/sumka-dlya-noutbuka-rivacase-7760-156-sportivnyy_3.jpg	f	855	Сумка для ноутбука RivaCase 7760 15.6" спортивный.	gallery	3	\N	web
2193	product_images/sumka-dlya-noutbuka-rivacase-7760-156-sportivnyy_8.jpg	f	855	Сумка для ноутбука RivaCase 7760 15.6" спортивный.	gallery	8	\N	web
2194	product_images/korpus-aeromax-wsc-60116012-black-with-usb-20_0.jpg	t	542	Корпус Aeromax WSC-6011\\6012 Black with USB 2,0	main	0	\N	web
2195	product_images/mysh-ritmix-rom-307-black-800-2400-dpi-usb-135m_0.jpg	t	685	Мышь RITMIX ROM-307 Black 800-2400 dpi; USB 1.35м	main	0	\N	web
2196	product_images/mysh-ritmix-rom-307-black-800-2400-dpi-usb-135m_3.jpg	f	685	Мышь RITMIX ROM-307 Black 800-2400 dpi; USB 1.35м	gallery	3	\N	web
2197	product_images/mysh-ritmix-rom-307-black-800-2400-dpi-usb-135m_5.png	f	685	Мышь RITMIX ROM-307 Black 800-2400 dpi; USB 1.35м	gallery	5	\N	web
2198	product_images/secure-digital-card-micro-64gb_3.jpg	f	571	Secure Digital Card micro 64GB	gallery	3	\N	web
2199	product_images/secure-digital-card-micro-64gb_4.jpg	f	571	Secure Digital Card micro 64GB	gallery	4	\N	web
2200	product_images/secure-digital-card-micro-64gb_6.jpg	f	571	Secure Digital Card micro 64GB	gallery	6	\N	web
2201	product_images/naushniki-genius-hs-g560-2xjack-20hz-20khz-113db-54db-chernye_0.png	t	693	Наушники Genius HS-G560 2xJack, 20Hz-20kHz, 113dB/-54dB, черные	main	0	\N	web
2202	product_images/naushniki-genius-hs-g560-2xjack-20hz-20khz-113db-54db-chernye_1.jpg	f	693	Наушники Genius HS-G560 2xJack, 20Hz-20kHz, 113dB/-54dB, черные	gallery	1	\N	web
2203	product_images/naushniki-genius-hs-g560-2xjack-20hz-20khz-113db-54db-chernye_6.jpg	f	693	Наушники Genius HS-G560 2xJack, 20Hz-20kHz, 113dB/-54dB, черные	gallery	6	\N	web
2204	product_images/acer-27-xz270-curved-va-180hrz-1920x1080-fhd-speakers-2x2w_7.jpg	f	622	ACER 27" XZ270 CURVED VA 180Hrz \\1920x1080 FHD Speakers 2x2W	gallery	7	\N	web
2205	product_images/acer-27-xz270-curved-va-180hrz-1920x1080-fhd-speakers-2x2w_8.jpg	f	622	ACER 27" XZ270 CURVED VA 180Hrz \\1920x1080 FHD Speakers 2x2W	gallery	8	\N	web
2206	product_images/kolesiki_0.jpg	t	821	Колесики	main	0	\N	web
2207	product_images/kolesiki_1.jpg	f	821	Колесики	gallery	1	\N	web
2208	product_images/kolesiki_2.jpg	f	821	Колесики	gallery	2	\N	web
2209	product_images/wireless-lan-adapter-tp-link-tl-wn725n-wi-fi-150mb-usb_0.jpg	t	732	Wireless LAN Adapter TP-Link TL-WN725N Wi-Fi 150Мб USB	main	0	\N	web
2210	product_images/wireless-lan-adapter-tp-link-tl-wn725n-wi-fi-150mb-usb_1.jpg	f	732	Wireless LAN Adapter TP-Link TL-WN725N Wi-Fi 150Мб USB	gallery	1	\N	web
2211	product_images/wireless-lan-adapter-tp-link-tl-wn725n-wi-fi-150mb-usb_2.jpg	f	732	Wireless LAN Adapter TP-Link TL-WN725N Wi-Fi 150Мб USB	gallery	2	\N	web
2212	product_images/naushniki-s-mikrofonom-a4tech-bloody-g230p-rgb-gaming-35mm-black_1.jpg	f	699	Наушники с микрофоном A4Tech BLOODY G230P RGB Gaming 3.5mm Black	gallery	1	\N	web
2213	product_images/naushniki-s-mikrofonom-a4tech-bloody-g230p-rgb-gaming-35mm-black_3.jpg	f	699	Наушники с микрофоном A4Tech BLOODY G230P RGB Gaming 3.5mm Black	gallery	3	\N	web
2214	product_images/twsc-256gb-pcie-nvme-gen4x4-m2-2280-rw-speed-up-to-34002600mbs_3.jpg	f	585	TWSC 256GB PCIe NVMe Gen4x4, M.2 2280, RW Speed up to 3400/2600MB/s	gallery	3	\N	web
2215	product_images/twsc-256gb-pcie-nvme-gen4x4-m2-2280-rw-speed-up-to-34002600mbs_5.jpg	f	585	TWSC 256GB PCIe NVMe Gen4x4, M.2 2280, RW Speed up to 3400/2600MB/s	gallery	5	\N	web
2216	product_images/twsc-256gb-pcie-nvme-gen4x4-m2-2280-rw-speed-up-to-34002600mbs_7.jpg	f	585	TWSC 256GB PCIe NVMe Gen4x4, M.2 2280, RW Speed up to 3400/2600MB/s	gallery	7	\N	web
2217	product_images/cable-usb-ekronirovannyy-5m_0.jpg	t	514	Cable USB экронированный 5м	main	0	\N	web
2218	product_images/cable-usb-ekronirovannyy-5m_2.jpg	f	514	Cable USB экронированный 5м	gallery	2	\N	web
2219	product_images/cable-usb-ekronirovannyy-5m_6.jpg	f	514	Cable USB экронированный 5м	gallery	6	\N	web
2220	product_images/psu-jump-dr-450-total-450-500w-24pin4p1fdd3sata2ata_0.jpg	t	762	PSU Jump DR- 450 (total 450-500W) 24PIN+4P+1FDD+3SATA+2ATA,	main	0	\N	web
2221	product_images/psu-jump-dr-450-total-450-500w-24pin4p1fdd3sata2ata_2.jpg	f	762	PSU Jump DR- 450 (total 450-500W) 24PIN+4P+1FDD+3SATA+2ATA,	gallery	2	\N	web
2222	product_images/psu-jump-dr-450-total-450-500w-24pin4p1fdd3sata2ata_3.jpg	f	762	PSU Jump DR- 450 (total 450-500W) 24PIN+4P+1FDD+3SATA+2ATA,	gallery	3	\N	web
2223	product_images/lcd-32samsung-ls32fg512eixci-odyssey-g5-black-va-2560x1440-180hz_0.jpg	t	623	LCD 32"Samsung LS32FG512EIXCI, Odyssey G5, Black, VA, 2560x1440, 180Hz	main	0	\N	web
2224	product_images/lcd-32samsung-ls32fg512eixci-odyssey-g5-black-va-2560x1440-180hz_2.jpg	f	623	LCD 32"Samsung LS32FG512EIXCI, Odyssey G5, Black, VA, 2560x1440, 180Hz	gallery	2	\N	web
2225	product_images/lcd-32samsung-ls32fg512eixci-odyssey-g5-black-va-2560x1440-180hz_3.jpg	f	623	LCD 32"Samsung LS32FG512EIXCI, Odyssey G5, Black, VA, 2560x1440, 180Hz	gallery	3	\N	web
2226	product_images/hp-15-fd0230wm-intel-core-i3-n305-16gb-ddr4-3200mhz-512gb-ssd-156_0.webp	t	751	Hp 15-fd0230wm Intel Core i3-N305, 16GB DDR4-3200Mhz, 512GB SSD, 15.6"	main	0	\N	web
2227	product_images/hp-15-fd0230wm-intel-core-i3-n305-16gb-ddr4-3200mhz-512gb-ssd-156_1.webp	f	751	Hp 15-fd0230wm Intel Core i3-N305, 16GB DDR4-3200Mhz, 512GB SSD, 15.6"	gallery	1	\N	web
2228	product_images/hp-15-fd0230wm-intel-core-i3-n305-16gb-ddr4-3200mhz-512gb-ssd-156_2.jpg	f	751	Hp 15-fd0230wm Intel Core i3-N305, 16GB DDR4-3200Mhz, 512GB SSD, 15.6"	gallery	2	\N	web
2229	product_images/stul-dermantinovyy-na-zheleznyh-nozhkah-s-ruchkami-eko-kozha-kachestv_1.png	f	828	Стул дермантиновый на железных ножках - с ручками эко-кожа - качеств	gallery	1	\N	web
2230	product_images/stul-dermantinovyy-na-zheleznyh-nozhkah-s-ruchkami-eko-kozha-kachestv_2.jpg	f	828	Стул дермантиновый на железных ножках - с ручками эко-кожа - качеств	gallery	2	\N	web
2231	product_images/stul-dermantinovyy-na-zheleznyh-nozhkah-s-ruchkami-eko-kozha-kachestv_4.jpg	f	828	Стул дермантиновый на железных ножках - с ручками эко-кожа - качеств	gallery	4	\N	web
2232	product_images/kabel-hdmi-hdmi-5-m_0.jpg	t	531	Кабель HDMI - HDMI 5 m	main	0	\N	web
2233	product_images/kabel-hdmi-hdmi-5-m_1.jpg	f	531	Кабель HDMI - HDMI 5 m	gallery	1	\N	web
2234	product_images/kabel-hdmi-hdmi-5-m_4.jpg	f	531	Кабель HDMI - HDMI 5 m	gallery	4	\N	web
2235	product_images/uniview-24-mw-lc24-led-va-fhd-169100hz14ms30001178178250cd_0.jpg	t	628	UNIVIEW 24" MW-LC24 LED VA FHD 16:9/100Hz/14ms/3000:1/178/178/250cd	main	0	\N	web
2236	product_images/uniview-24-mw-lc24-led-va-fhd-169100hz14ms30001178178250cd_1.jpg	f	628	UNIVIEW 24" MW-LC24 LED VA FHD 16:9/100Hz/14ms/3000:1/178/178/250cd	gallery	1	\N	web
2237	product_images/uniview-24-mw-lc24-led-va-fhd-169100hz14ms30001178178250cd_2.png	f	628	UNIVIEW 24" MW-LC24 LED VA FHD 16:9/100Hz/14ms/3000:1/178/178/250cd	gallery	2	\N	web
2238	product_images/mouse-genius-nx-7005-usb-optical-besprovodnaya_3.jpg	f	669	Mouse Genius NX-7005 USB Optical -Беспроводная	gallery	3	\N	web
2239	product_images/mouse-genius-nx-7005-usb-optical-besprovodnaya_5.png	f	669	Mouse Genius NX-7005 USB Optical -Беспроводная	gallery	5	\N	web
2240	product_images/mouse-genius-nx-7005-usb-optical-besprovodnaya_6.png	f	669	Mouse Genius NX-7005 USB Optical -Беспроводная	gallery	6	\N	web
2241	product_images/mouse-winstar-ws-ms-930-usb_0.jpg	t	675	Mouse Winstar WS-MS-930 USB	main	0	\N	web
2242	product_images/mouse-winstar-ws-ms-930-usb_1.jpg	f	675	Mouse Winstar WS-MS-930 USB	gallery	1	\N	web
2243	product_images/mouse-winstar-ws-ms-930-usb_2.jpg	f	675	Mouse Winstar WS-MS-930 USB	gallery	2	\N	web
2244	product_images/mouse-genius-nx-7015-usb-optical-besprovodnaya_1.jpg	f	670	Mouse Genius NX-7015 USB Optical -Беспроводная	gallery	1	\N	web
2245	product_images/mouse-genius-nx-7015-usb-optical-besprovodnaya_4.png	f	670	Mouse Genius NX-7015 USB Optical -Беспроводная	gallery	4	\N	web
2246	product_images/mouse-genius-nx-7015-usb-optical-besprovodnaya_6.png	f	670	Mouse Genius NX-7015 USB Optical -Беспроводная	gallery	6	\N	web
2247	product_images/setevoy-filtr-era-bazovaya-zaschita-5gn-5-m-pvs-10a-sz-s-vykl-belyycher_1.jpg	f	560	Сетевой фильтр ЭРА базовая защита 5гн 5 м ПВС 10А с/з с выкл белый\\чер	gallery	1	\N	web
2248	product_images/setevoy-filtr-era-bazovaya-zaschita-5gn-5-m-pvs-10a-sz-s-vykl-belyycher_3.jpg	f	560	Сетевой фильтр ЭРА базовая защита 5гн 5 м ПВС 10А с/з с выкл белый\\чер	gallery	3	\N	web
2249	product_images/setevoy-filtr-era-bazovaya-zaschita-5gn-5-m-pvs-10a-sz-s-vykl-belyycher_4.jpg	f	560	Сетевой фильтр ЭРА базовая защита 5гн 5 м ПВС 10А с/з с выкл белый\\чер	gallery	4	\N	web
2250	product_images/naushniki-s-mikrofonom-microlab-g4-gaming-blackblue_3.png	f	709	Наушники с микрофоном Microlab G4 GAMING BLACK/BLUE	gallery	3	\N	web
2251	product_images/naushniki-s-mikrofonom-microlab-g4-gaming-blackblue_5.jpg	f	709	Наушники с микрофоном Microlab G4 GAMING BLACK/BLUE	gallery	5	\N	web
2252	product_images/naushniki-s-mikrofonom-microlab-g4-gaming-blackblue_6.png	f	709	Наушники с микрофоном Microlab G4 GAMING BLACK/BLUE	gallery	6	\N	web
2253	product_images/naushniki-s-mikrofonom-genius-hs-m200c-dugovye_4.jpg	f	708	Наушники с микрофоном Genius HS-M200C , Дуговые	gallery	4	\N	web
2254	product_images/cooler-80h25_1.jpg	f	545	Cooler 80х25	gallery	1	\N	web
2255	product_images/cooler-80h25_2.jpg	f	545	Cooler 80х25	gallery	2	\N	web
2256	product_images/cooler-80h25_5.jpg	f	545	Cooler 80х25	gallery	5	\N	web
2257	product_images/cpu-cooler-deepcool-theta-31_4.jpg	f	553	CPU cooler DEEPCOOL THETA-31	gallery	4	\N	web
2258	product_images/cpu-cooler-deepcool-theta-31_5.jpg	f	553	CPU cooler DEEPCOOL THETA-31	gallery	5	\N	web
2259	product_images/cpu-cooler-deepcool-theta-31_6.jpg	f	553	CPU cooler DEEPCOOL THETA-31	gallery	6	\N	web
2260	product_images/speakers-fontan_6.jpg	f	795	Speakers Фонтан	gallery	6	\N	web
2261	product_images/monitor-lcd-27-xiaomi-redmi-g27q-240hz-ips-2560x1440-240hz_7.jpg	f	632	Монитор LCD 27" Xiaomi Redmi G27Q 240Hz, IPS, 2560x1440, 240Hz,	gallery	7	\N	web
2262	product_images/stul-ofisnyy-prostoy_0.jpg	t	831	Стул офисный - простой	main	0	\N	web
2263	product_images/stul-ofisnyy-prostoy_1.jpg	f	831	Стул офисный - простой	gallery	1	\N	web
2265	product_images/antivirus-drweb-security-space-2pk-1god_0.png	t	811	Антивирус Dr.Web Security Space 2пк \\ 1год	main	0	\N	web
2266	product_images/antivirus-drweb-security-space-2pk-1god_1.jpg	f	811	Антивирус Dr.Web Security Space 2пк \\ 1год	gallery	1	\N	web
2267	product_images/antivirus-drweb-security-space-2pk-1god_3.jpg	f	811	Антивирус Dr.Web Security Space 2пк \\ 1год	gallery	3	\N	web
2268	product_images/mouse-x-game-xm-880oub-1000dpi-opticheskiy-usb-chernyy_0.jpg	t	676	Mouse X-Game, XM-880OUB, 1000DPI, Оптический, USB, Черный	main	0	\N	web
2269	product_images/mouse-x-game-xm-880oub-1000dpi-opticheskiy-usb-chernyy_3.png	f	676	Mouse X-Game, XM-880OUB, 1000DPI, Оптический, USB, Черный	gallery	3	\N	web
2270	product_images/ethernet-adapter-tp-link-3468-101001000-mbps-pce-ex_1.jpg	f	717	Ethernet Adapter TP-Link 3468 10/100/1000 Mbps, PCE Ex	gallery	1	\N	web
2271	product_images/ethernet-adapter-tp-link-3468-101001000-mbps-pce-ex_6.jpg	f	717	Ethernet Adapter TP-Link 3468 10/100/1000 Mbps, PCE Ex	gallery	6	\N	web
2272	product_images/naushniki-s-mikrofonom-microlab-g6-gaming-blackred_2.png	f	710	Наушники с микрофоном Microlab G6 GAMING BLACK/RED	gallery	2	\N	web
2273	product_images/naushniki-s-mikrofonom-microlab-g6-gaming-blackred_5.jpg	f	710	Наушники с микрофоном Microlab G6 GAMING BLACK/RED	gallery	5	\N	web
2274	product_images/naushniki-s-mikrofonom-microlab-g6-gaming-blackred_6.jpg	f	710	Наушники с микрофоном Microlab G6 GAMING BLACK/RED	gallery	6	\N	web
2275	product_images/klaviatura-x-gamexk-100ub-ultratonkaya-usb-angruskaz-chyornyy_4.jpg	f	605	Клавиатура, X-Game,XK-100UB Ультратонкая, USB, Анг/Рус/Каз, Чёрный	gallery	4	\N	web
2276	product_images/klaviatura-x-gamexk-100ub-ultratonkaya-usb-angruskaz-chyornyy_6.jpg	f	605	Клавиатура, X-Game,XK-100UB Ультратонкая, USB, Анг/Рус/Каз, Чёрный	gallery	6	\N	web
2277	product_images/klaviatura-x-gamexk-100ub-ultratonkaya-usb-angruskaz-chyornyy_7.jpg	f	605	Клавиатура, X-Game,XK-100UB Ультратонкая, USB, Анг/Рус/Каз, Чёрный	gallery	7	\N	web
2278	product_images/a4tech-kr-8372-kr-83op-720-keyboardmouse-set-usb-black-usrussian_2.jpg	f	587	A4TECH KR-8372 (KR-83+OP-720) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	2	\N	web
2279	product_images/a4tech-kr-8372-kr-83op-720-keyboardmouse-set-usb-black-usrussian_3.jpg	f	587	A4TECH KR-8372 (KR-83+OP-720) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	3	\N	web
2280	product_images/a4tech-kr-8372-kr-83op-720-keyboardmouse-set-usb-black-usrussian_4.jpg	f	587	A4TECH KR-8372 (KR-83+OP-720) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	4	\N	web
2281	product_images/klaviatura-delux-dlk-150gb-ultratonkaya-besprovodnaya-24ggts_1.jpg	f	604	Клавиатура Delux DLK-150GB, Ультратонкая, Беспроводная 2.4ГГц	gallery	1	\N	web
2282	product_images/klaviatura-delux-dlk-150gb-ultratonkaya-besprovodnaya-24ggts_4.jpg	f	604	Клавиатура Delux DLK-150GB, Ультратонкая, Беспроводная 2.4ГГц	gallery	4	\N	web
2283	product_images/podstavka-ohlazhdayuschaya-dlya-noutbuka-deepcool-n200_0.jpg	t	842	Подставка охлаждающая для ноутбука Deepcool N200	main	0	\N	web
2284	product_images/podstavka-ohlazhdayuschaya-dlya-noutbuka-deepcool-n200_1.jpg	f	842	Подставка охлаждающая для ноутбука Deepcool N200	gallery	1	\N	web
2285	product_images/podstavka-ohlazhdayuschaya-dlya-noutbuka-deepcool-n200_2.jpg	f	842	Подставка охлаждающая для ноутбука Deepcool N200	gallery	2	\N	web
2286	product_images/besprovodnaya-kolonka-edifier-mp85-85dba-50bt-22w-chernyy-2_1.jpg	f	799	Беспроводная колонка Edifier MP85 , 85dB(A), 5.0BT, 2.2W, Черный	gallery	1	\N	web
2287	product_images/besprovodnaya-kolonka-edifier-mp85-85dba-50bt-22w-chernyy-2_5.jpg	f	799	Беспроводная колонка Edifier MP85 , 85dB(A), 5.0BT, 2.2W, Черный	gallery	5	\N	web
2288	product_images/besprovodnaya-kolonka-edifier-mp85-85dba-50bt-22w-chernyy-2_6.jpg	f	799	Беспроводная колонка Edifier MP85 , 85dB(A), 5.0BT, 2.2W, Черный	gallery	6	\N	web
2289	product_images/mikrofon-sven-mk-490_4.jpg	f	691	Микрофон SVEN MK-490	gallery	4	\N	web
2290	product_images/cpu-lga1200-intel-core-i3-10105-36-44ghz6mb-cache-l3emt644-cores_1.jpg	f	767	CPU LGA1200 Intel Core i3-10105 3.6-4.4GHz,6MB Cache L3,EMT64,4 Cores	gallery	1	\N	web
2291	product_images/cpu-lga1200-intel-core-i3-10105-36-44ghz6mb-cache-l3emt644-cores_3.jpg	f	767	CPU LGA1200 Intel Core i3-10105 3.6-4.4GHz,6MB Cache L3,EMT64,4 Cores	gallery	3	\N	web
2292	product_images/cpu-lga1200-intel-core-i3-10105-36-44ghz6mb-cache-l3emt644-cores_5.jpg	f	767	CPU LGA1200 Intel Core i3-10105 3.6-4.4GHz,6MB Cache L3,EMT64,4 Cores	gallery	5	\N	web
2293	product_images/a4tech-bloody-es8-esports-rgb-mouse-sports-black-6000cpi-usb_2.png	f	641	A4TECH BLOODY ES8 ESPORTS RGB MOUSE SPORTS BLACK 6000CPI USB	gallery	2	\N	web
2294	product_images/a4tech-bloody-es8-esports-rgb-mouse-sports-black-6000cpi-usb_3.jpg	f	641	A4TECH BLOODY ES8 ESPORTS RGB MOUSE SPORTS BLACK 6000CPI USB	gallery	3	\N	web
2295	product_images/naushniki-s-mikrofonom-a4tech-hs-105_0.png	t	702	Наушники с микрофоном A4TECH HS-105	main	0	\N	web
2296	product_images/naushniki-s-mikrofonom-a4tech-hs-105_3.png	f	702	Наушники с микрофоном A4TECH HS-105	gallery	3	\N	web
2297	product_images/a4tech-op-760-optical-mouse-usb-black_2.jpg	f	639	A4TECH OP-760 OPTICAL MOUSE USB BLACK	gallery	2	\N	web
2298	product_images/a4tech-op-760-optical-mouse-usb-black_3.jpg	f	639	A4TECH OP-760 OPTICAL MOUSE USB BLACK	gallery	3	\N	web
2299	product_images/a4tech-op-760-optical-mouse-usb-black_6.jpg	f	639	A4TECH OP-760 OPTICAL MOUSE USB BLACK	gallery	6	\N	web
2300	product_images/hp-15-fc0171nia-athlon-silver-7120u-24-35ghz8gbssd-256gb156-fhd_1.png	f	750	HP 15-fc0171nia Athlon Silver 7120U 2.4-3.5GHz,8GB,SSD 256GB,15.6" FHD	gallery	1	\N	web
2301	product_images/hp-15-fc0171nia-athlon-silver-7120u-24-35ghz8gbssd-256gb156-fhd_3.png	f	750	HP 15-fc0171nia Athlon Silver 7120U 2.4-3.5GHz,8GB,SSD 256GB,15.6" FHD	gallery	3	\N	web
2302	product_images/hp-15-fc0171nia-athlon-silver-7120u-24-35ghz8gbssd-256gb156-fhd_6.webp	f	750	HP 15-fc0171nia Athlon Silver 7120U 2.4-3.5GHz,8GB,SSD 256GB,15.6" FHD	gallery	6	\N	web
2303	product_images/cetevoy-filtr-ekspert-6-rozetok-5m_1.jpg	f	558	Cетевой фильтр Эксперт - 6 розеток 5м	gallery	1	\N	web
2304	product_images/cetevoy-filtr-ekspert-6-rozetok-5m_2.webp	f	558	Cетевой фильтр Эксперт - 6 розеток 5м	gallery	2	\N	web
2305	product_images/cetevoy-filtr-ekspert-6-rozetok-5m_3.webp	f	558	Cетевой фильтр Эксперт - 6 розеток 5м	gallery	3	\N	web
2306	product_images/provod-dlya-noutbuka-2-dyrki_0.webp	t	534	Провод для ноутбука 2 дырки	main	0	\N	web
2307	product_images/provod-dlya-noutbuka-2-dyrki_1.jpg	f	534	Провод для ноутбука 2 дырки	gallery	1	\N	web
2308	product_images/provod-dlya-noutbuka-2-dyrki_2.jpg	f	534	Провод для ноутбука 2 дырки	gallery	2	\N	web
2309	product_images/cable-usb-ekronirovannyy-15m_1.jpg	f	511	Cable USB экронированный 1,5м	gallery	1	\N	web
2310	product_images/cable-usb-ekronirovannyy-15m_3.jpg	f	511	Cable USB экронированный 1,5м	gallery	3	\N	web
2311	product_images/cable-usb-ekronirovannyy-15m_5.jpg	f	511	Cable USB экронированный 1,5м	gallery	5	\N	web
2312	product_images/hub-usb-7port-deshovyy_1.jpg	f	844	HUB USB- 7Port - дешовый	gallery	1	\N	web
2313	product_images/hub-usb-7port-deshovyy_2.jpg	f	844	HUB USB- 7Port - дешовый	gallery	2	\N	web
2314	product_images/hub-usb-7port-deshovyy_3.jpg	f	844	HUB USB- 7Port - дешовый	gallery	3	\N	web
2315	product_images/nastolnyy-kronshteyn-dlya-monitorov-brateck-ldt12-t01-13-32_2.jpg	f	835	Настольный кронштейн для мониторов Brateck LDT12-T01, 13"-32"	gallery	2	\N	web
2316	product_images/nastolnyy-kronshteyn-dlya-monitorov-brateck-ldt12-t01-13-32_3.jpg	f	835	Настольный кронштейн для мониторов Brateck LDT12-T01, 13"-32"	gallery	3	\N	web
2317	product_images/nastolnyy-kronshteyn-dlya-monitorov-brateck-ldt12-t01-13-32_8.jpg	f	835	Настольный кронштейн для мониторов Brateck LDT12-T01, 13"-32"	gallery	8	\N	web
2318	product_images/cable-sata-pitanie_0.jpg	t	506	Cable SATA питание	main	0	\N	web
2319	product_images/cable-sata-pitanie_1.png	f	506	Cable SATA питание	gallery	1	\N	web
2320	product_images/cable-sata-pitanie_2.jpg	f	506	Cable SATA питание	gallery	2	\N	web
2321	product_images/web-cam-a4tech-pk-925h-1080p-fhd-usb-2mp16mp_0.jpg	t	688	Web Cam A4Tech PK-925H 1080p FHD USB 2MP(16MP)	main	0	\N	web
2322	product_images/web-cam-a4tech-pk-925h-1080p-fhd-usb-2mp16mp_3.jpg	f	688	Web Cam A4Tech PK-925H 1080p FHD USB 2MP(16MP)	gallery	3	\N	web
2323	product_images/web-cam-a4tech-pk-925h-1080p-fhd-usb-2mp16mp_4.jpg	f	688	Web Cam A4Tech PK-925H 1080p FHD USB 2MP(16MP)	gallery	4	\N	web
2324	product_images/power-cable_0.jpg	t	520	Power cable	main	0	\N	web
2325	product_images/power-cable_1.jpg	f	520	Power cable	gallery	1	\N	web
2326	product_images/power-cable_2.jpg	f	520	Power cable	gallery	2	\N	web
2327	product_images/hub-hikvision-8-port-101001000_0.jpg	t	721	HUB HIKVISION 8-port 10/100/1000	main	0	\N	web
2328	product_images/hub-hikvision-8-port-101001000_2.png	f	721	HUB HIKVISION 8-port 10/100/1000	gallery	2	\N	web
2329	product_images/hub-hikvision-8-port-101001000_3.jpg	f	721	HUB HIKVISION 8-port 10/100/1000	gallery	3	\N	web
2330	product_images/setevoy-adapter-usb-20-100mb-rg45lan_4.png	f	742	Сетевой адаптер USB 2,0 /100Mb (RG45Lan)	gallery	4	\N	web
2331	product_images/setevoy-adapter-usb-20-100mb-rg45lan_5.jpg	f	742	Сетевой адаптер USB 2,0 /100Mb (RG45Lan)	gallery	5	\N	web
2332	product_images/hub-switch-tp-link-5-port-101001000-bit_2.jpg	f	724	HUB Switch TP-Link 5-port 10/100\\1000 бит	gallery	2	\N	web
2333	product_images/hub-switch-tp-link-5-port-101001000-bit_3.jpg	f	724	HUB Switch TP-Link 5-port 10/100\\1000 бит	gallery	3	\N	web
2334	product_images/hub-switch-tp-link-5-port-101001000-bit_7.jpg	f	724	HUB Switch TP-Link 5-port 10/100\\1000 бит	gallery	7	\N	web
2335	product_images/speakers-microlab-b-22-6w-20-usb_6.jpg	f	788	Speakers Microlab B-22 6W 2.0 USB	gallery	6	\N	web
2336	product_images/speakers-microlab-b-22-6w-20-usb_8.jpg	f	788	Speakers Microlab B-22 6W 2.0 USB	gallery	8	\N	web
2337	product_images/zaryadnoe-ustroystvo-na-noutbuk-90w-universal-slim_0.jpg	t	849	Зарядное устройство на ноутбук - 90W - универсал - SLIM	main	0	\N	web
2338	product_images/zaryadnoe-ustroystvo-na-noutbuk-90w-universal-slim_1.jpg	f	849	Зарядное устройство на ноутбук - 90W - универсал - SLIM	gallery	1	\N	web
2339	product_images/zaryadnoe-ustroystvo-na-noutbuk-90w-universal-slim_2.png	f	849	Зарядное устройство на ноутбук - 90W - универсал - SLIM	gallery	2	\N	web
2340	product_images/kreslo-krutyaschiesya-kachayuschiesya-chernoe-komfort-s-podst-dlya-nog_0.jpg	t	826	Кресло крутящиеся - качающиеся черное "Комфорт" с подст для ног	main	0	\N	web
2341	product_images/kreslo-krutyaschiesya-kachayuschiesya-chernoe-komfort-s-podst-dlya-nog_1.jpg	f	826	Кресло крутящиеся - качающиеся черное "Комфорт" с подст для ног	gallery	1	\N	web
2342	product_images/kreslo-krutyaschiesya-kachayuschiesya-chernoe-komfort-s-podst-dlya-nog_3.jpg	f	826	Кресло крутящиеся - качающиеся черное "Комфорт" с подст для ног	gallery	3	\N	web
2343	product_images/blok-pitaniya-jump-dr-380r-350watx-204-pin-44pin-3sata-1molex_2.webp	f	764	Блок питания Jump DR-380R, 350WATX, 20+4 pin, 4+4pin, 3*Sata, 1*Molex	gallery	2	\N	web
2344	product_images/blok-pitaniya-jump-dr-380r-350watx-204-pin-44pin-3sata-1molex_5.jpg	f	764	Блок питания Jump DR-380R, 350WATX, 20+4 pin, 4+4pin, 3*Sata, 1*Molex	gallery	5	\N	web
2345	product_images/blok-pitaniya-jump-dr-380r-350watx-204-pin-44pin-3sata-1molex_7.jpg	f	764	Блок питания Jump DR-380R, 350WATX, 20+4 pin, 4+4pin, 3*Sata, 1*Molex	gallery	7	\N	web
2346	product_images/psu-jump-atx-800-p4-total-800w-80-bronze_0.jpg	t	761	PSU Jump ATX 800-P4 (total 800W) 80+ Bronze	main	0	\N	web
2347	product_images/psu-jump-atx-800-p4-total-800w-80-bronze_1.webp	f	761	PSU Jump ATX 800-P4 (total 800W) 80+ Bronze	gallery	1	\N	web
2348	product_images/psu-jump-atx-800-p4-total-800w-80-bronze_2.jpg	f	761	PSU Jump ATX 800-P4 (total 800W) 80+ Bronze	gallery	2	\N	web
2349	product_images/secure-digital-card-micro-128mb-kingston_2.png	f	567	Secure Digital Card micro 128MB kingston	gallery	2	\N	web
2350	product_images/secure-digital-card-micro-128mb-kingston_3.png	f	567	Secure Digital Card micro 128MB kingston	gallery	3	\N	web
2351	product_images/secure-digital-card-micro-128mb-kingston_5.jpg	f	567	Secure Digital Card micro 128MB kingston	gallery	5	\N	web
2352	product_images/wireless-router-mikrotik-hap-lite_0.png	t	735	Wireless Router MikroTik hAP Lite	main	0	\N	web
2353	product_images/wireless-router-mikrotik-hap-lite_1.png	f	735	Wireless Router MikroTik hAP Lite	gallery	1	\N	web
2354	product_images/wireless-router-mikrotik-hap-lite_2.png	f	735	Wireless Router MikroTik hAP Lite	gallery	2	\N	web
2355	product_images/mouse-a4tech-g3-300n-v-track-black-1000-dpi-usb-padless-wireless_1.jpg	f	660	Mouse A4Tech G3-300N V-Track, Black, 1000 dpi, USB, padless wireless	gallery	1	\N	web
2356	product_images/mouse-a4tech-g3-300n-v-track-black-1000-dpi-usb-padless-wireless_2.jpg	f	660	Mouse A4Tech G3-300N V-Track, Black, 1000 dpi, USB, padless wireless	gallery	2	\N	web
2357	product_images/mouse-a4tech-g3-300n-v-track-black-1000-dpi-usb-padless-wireless_3.jpg	f	660	Mouse A4Tech G3-300N V-Track, Black, 1000 dpi, USB, padless wireless	gallery	3	\N	web
2358	product_images/delux-m321bu-optical-black-colorusb-cable-1000-dpi_0.png	t	658	Delux M321BU Optical black color,USB cable, 1000 DPI	main	0	\N	web
2359	product_images/delux-m321bu-optical-black-colorusb-cable-1000-dpi_6.jpg	f	658	Delux M321BU Optical black color,USB cable, 1000 DPI	gallery	6	\N	web
2360	product_images/a4tech-kk-3330-kk-3op-330-keyboardmouse-set-usb-black-usrussian_0.jpg	t	586	A4TECH KK-3330 (KK-3+OP-330) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	main	0	\N	web
2361	product_images/a4tech-kk-3330-kk-3op-330-keyboardmouse-set-usb-black-usrussian_2.jpg	f	586	A4TECH KK-3330 (KK-3+OP-330) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	2	\N	web
2362	product_images/a4tech-kk-3330-kk-3op-330-keyboardmouse-set-usb-black-usrussian_3.jpg	f	586	A4TECH KK-3330 (KK-3+OP-330) KEYBOARD+MOUSE SET USB BLACK US+RUSSIAN	gallery	3	\N	web
2363	product_images/cable-usb-ekronirovannyy-3m_1.jpg	f	513	Cable USB экронированный 3м	gallery	1	\N	web
2364	product_images/cable-usb-ekronirovannyy-3m_3.jpg	f	513	Cable USB экронированный 3м	gallery	3	\N	web
2365	product_images/cable-usb-ekronirovannyy-3m_4.jpg	f	513	Cable USB экронированный 3м	gallery	4	\N	web
2366	product_images/usb-razvetvitelhab-7-port-hub-s-vyklyuchatelem-507-30_1.jpg	f	845	USB Разветвитель\\Хаб -7 Port HUB с выключателем 507 3,0	gallery	1	\N	web
2367	product_images/usb-razvetvitelhab-7-port-hub-s-vyklyuchatelem-507-30_2.jpg	f	845	USB Разветвитель\\Хаб -7 Port HUB с выключателем 507 3,0	gallery	2	\N	web
2368	product_images/usb-razvetvitelhab-7-port-hub-s-vyklyuchatelem-507-30_3.jpg	f	845	USB Разветвитель\\Хаб -7 Port HUB с выключателем 507 3,0	gallery	3	\N	web
2369	product_images/kabel-hdmi-hdmi-20m_2.jpg	f	529	Кабель HDMI - HDMI 20m	gallery	2	\N	web
2370	product_images/kabel-hdmi-hdmi-20m_7.jpg	f	529	Кабель HDMI - HDMI 20m	gallery	7	\N	web
2371	product_images/a4tech-bloody-b500n-gaming-mecha-like-switch-neon-backlight-keyboard-u_0.jpg	t	591	A4TECH BLOODY B500N GAMING MECHA-LIKE SWITCH NEON BACKLIGHT KEYBOARD U	main	0	\N	web
2372	product_images/a4tech-bloody-b500n-gaming-mecha-like-switch-neon-backlight-keyboard-u_1.jpg	f	591	A4TECH BLOODY B500N GAMING MECHA-LIKE SWITCH NEON BACKLIGHT KEYBOARD U	gallery	1	\N	web
2373	product_images/a4tech-bloody-b500n-gaming-mecha-like-switch-neon-backlight-keyboard-u_4.jpg	f	591	A4TECH BLOODY B500N GAMING MECHA-LIKE SWITCH NEON BACKLIGHT KEYBOARD U	gallery	4	\N	web
2374	product_images/cpu-cooler-deepcool-theta-21-1100-3200rpm_0.jpg	t	552	CPU cooler DEEPCOOL THETA-21 1100-3200rpm	main	0	\N	web
2375	product_images/cpu-cooler-deepcool-theta-21-1100-3200rpm_2.jpg	f	552	CPU cooler DEEPCOOL THETA-21 1100-3200rpm	gallery	2	\N	web
2376	product_images/cpu-cooler-deepcool-theta-21-1100-3200rpm_7.jpg	f	552	CPU cooler DEEPCOOL THETA-21 1100-3200rpm	gallery	7	\N	web
2377	product_images/cetevoy-filtr-ekspert-6-rozetok-3m_1.jpg	f	557	Cетевой фильтр Эксперт - 6 розеток 3м	gallery	1	\N	web
2378	product_images/cetevoy-filtr-ekspert-6-rozetok-3m_2.webp	f	557	Cетевой фильтр Эксперт - 6 розеток 3м	gallery	2	\N	web
2379	product_images/cetevoy-filtr-ekspert-6-rozetok-3m_4.jpg	f	557	Cетевой фильтр Эксперт - 6 розеток 3м	gallery	4	\N	web
2380	product_images/microlab-subwoofer-m-111-21-12w-5w25w2-black_0.png	t	778	Microlab Subwoofer M-111 2.1 12W (5W+2.5W*2) BLACK	main	0	\N	web
2381	product_images/microlab-subwoofer-m-111-21-12w-5w25w2-black_1.jpg	f	778	Microlab Subwoofer M-111 2.1 12W (5W+2.5W*2) BLACK	gallery	1	\N	web
2382	product_images/microlab-subwoofer-m-111-21-12w-5w25w2-black_4.jpg	f	778	Microlab Subwoofer M-111 2.1 12W (5W+2.5W*2) BLACK	gallery	4	\N	web
2383	product_images/power-cable-15m-chernyy_0.jpg	t	521	Power cable 1,5м черный	main	0	\N	web
2384	product_images/power-cable-15m-chernyy_2.jpg	f	521	Power cable 1,5м черный	gallery	2	\N	web
2386	product_images/sumochka-dlya-hdd-25-rivacase-9101_7.jpg	f	870	Сумочка для HDD 2.5" RivaCase 9101	gallery	7	\N	web
2387	product_images/sumochka-dlya-hdd-25-rivacase-9101_8.webp	f	870	Сумочка для HDD 2.5" RivaCase 9101	gallery	8	\N	web
2388	product_images/perehodnik-hdmi-papa-hdmi-mama-g-obraznyy_1.jpg	f	502	Переходник HDMI папа - HDMI мама (Г-образный)	gallery	1	\N	web
2389	product_images/cable-utp-5-andizhan-dlya-vnutrennih-rabot_0.jpg	t	715	Cable UTP-5 Андижан для внутренних работ	main	0	\N	web
2390	product_images/cable-utp-5-andizhan-dlya-vnutrennih-rabot_2.jpg	f	715	Cable UTP-5 Андижан для внутренних работ	gallery	2	\N	web
2391	product_images/cable-utp-5-andizhan-dlya-vnutrennih-rabot_4.png	f	715	Cable UTP-5 Андижан для внутренних работ	gallery	4	\N	web
2392	product_images/tp-link-td-w8961n-300mbps-wireless-n-adsl2-modem-router-trendchipr_1.jpg	f	621	TP-Link TD-W8961N 300Mbps Wireless N ADSL2+ Modem Router, Trendchip+R	gallery	1	\N	web
2393	product_images/tp-link-td-w8961n-300mbps-wireless-n-adsl2-modem-router-trendchipr_5.jpg	f	621	TP-Link TD-W8961N 300Mbps Wireless N ADSL2+ Modem Router, Trendchip+R	gallery	5	\N	web
2394	product_images/tp-link-td-w8961n-300mbps-wireless-n-adsl2-modem-router-trendchipr_8.jpg	f	621	TP-Link TD-W8961N 300Mbps Wireless N ADSL2+ Modem Router, Trendchip+R	gallery	8	\N	web
2395	product_images/wireless-router-mikrotik-hap-ah2_0.png	t	734	Wireless Router MikroTik hAP Aх2	main	0	\N	web
2396	product_images/wireless-router-mikrotik-hap-ah2_1.jpg	f	734	Wireless Router MikroTik hAP Aх2	gallery	1	\N	web
2397	product_images/wireless-router-mikrotik-hap-ah2_3.jpg	f	734	Wireless Router MikroTik hAP Aх2	gallery	3	\N	web
2398	product_images/speakers-sven-445_0.png	t	794	Speakers SVEN 445	main	0	\N	web
2399	product_images/speakers-sven-445_3.png	f	794	Speakers SVEN 445	gallery	3	\N	web
2400	product_images/klaviaturamysh-x-gamexd-1100ub-usb-angruskaz16m_1.jpg	f	607	Клавиатура+мышь X-Game,XD-1100UB, USB, Анг/Рус/Каз,1,6м	gallery	1	\N	web
2401	product_images/klaviaturamysh-x-gamexd-1100ub-usb-angruskaz16m_3.jpg	f	607	Клавиатура+мышь X-Game,XD-1100UB, USB, Анг/Рус/Каз,1,6м	gallery	3	\N	web
2402	product_images/klaviaturamysh-x-gamexd-1100ub-usb-angruskaz16m_5.webp	f	607	Клавиатура+мышь X-Game,XD-1100UB, USB, Анг/Рус/Каз,1,6м	gallery	5	\N	web
2403	product_images/sumka-dlya-noutbuka-rivacase-7931-156_1.jpg	f	862	Сумка для ноутбука RivaCase 7931 15,6"	gallery	1	\N	web
2404	product_images/sumka-dlya-noutbuka-rivacase-7931-156_2.jpg	f	862	Сумка для ноутбука RivaCase 7931 15,6"	gallery	2	\N	web
2405	product_images/sumka-dlya-noutbuka-rivacase-7931-156_3.jpg	f	862	Сумка для ноутбука RivaCase 7931 15,6"	gallery	3	\N	web
2406	product_images/perehodnik-dvi-na-vga_1.jpg	f	501	Переходник DVI на VGA	gallery	1	\N	web
2407	product_images/perehodnik-dvi-na-vga_2.jpg	f	501	Переходник DVI на VGA	gallery	2	\N	web
2408	product_images/perehodnik-dvi-na-vga_3.jpg	f	501	Переходник DVI на VGA	gallery	3	\N	web
2409	product_images/cable-usb-3-m-udlinitel-ekranir_0.jpg	t	509	Cable USB 3 m (удлинитель) экранир	main	0	\N	web
2410	product_images/cable-usb-3-m-udlinitel-ekranir_1.jpg	f	509	Cable USB 3 m (удлинитель) экранир	gallery	1	\N	web
2411	product_images/cable-usb-3-m-udlinitel-ekranir_2.jpg	f	509	Cable USB 3 m (удлинитель) экранир	gallery	2	\N	web
2412	product_images/cable-utp-5-dahua-dlya-vnutrennih-rabot_3.png	f	713	Cable UTP-5 DAHUA для внутренних работ	gallery	3	\N	web
2413	product_images/cable-utp-5-dahua-dlya-vnutrennih-rabot_4.png	f	713	Cable UTP-5 DAHUA для внутренних работ	gallery	4	\N	web
2414	product_images/cable-utp-5-dahua-dlya-vnutrennih-rabot_6.png	f	713	Cable UTP-5 DAHUA для внутренних работ	gallery	6	\N	web
2415	product_images/cable-vga-10m_0.png	t	516	Cable VGA 10м	main	0	\N	web
2416	product_images/cable-vga-10m_1.jpg	f	516	Cable VGA 10м	gallery	1	\N	web
2417	product_images/cable-vga-10m_2.jpg	f	516	Cable VGA 10м	gallery	2	\N	web
2418	product_images/stul-krutyaschiysya-ekokozha-ploskaya-spinka-chernyy-131_0.jpg	t	830	Стул крутящийся - экокожа плоская спинка \\черный (131)	main	0	\N	web
2419	product_images/stul-krutyaschiysya-ekokozha-ploskaya-spinka-chernyy-131_1.jpg	f	830	Стул крутящийся - экокожа плоская спинка \\черный (131)	gallery	1	\N	web
2420	product_images/stul-krutyaschiysya-ekokozha-ploskaya-spinka-chernyy-131_2.jpg	f	830	Стул крутящийся - экокожа плоская спинка \\черный (131)	gallery	2	\N	web
2421	product_images/ssd-twinmos-alphapro-128gb-3d-nand-m2_1.jpg	f	580	SSD TWINMOS AlphaPRO 128GB 3D NAND M.2	gallery	1	\N	web
2422	product_images/ssd-twinmos-alphapro-128gb-3d-nand-m2_4.png	f	580	SSD TWINMOS AlphaPRO 128GB 3D NAND M.2	gallery	4	\N	web
2423	product_images/ssd-twinmos-alphapro-128gb-3d-nand-m2_7.jpg	f	580	SSD TWINMOS AlphaPRO 128GB 3D NAND M.2	gallery	7	\N	web
2424	product_images/ohlazhdayuschaya-podstavka-dlya-planshetanoutbuka-zalman-zm-ns2000_1.jpg	f	840	Охлаждающая подставка для планшета/ноутбука Zalman ZM-NS2000	gallery	1	\N	web
2425	product_images/ohlazhdayuschaya-podstavka-dlya-planshetanoutbuka-zalman-zm-ns2000_4.jpg	f	840	Охлаждающая подставка для планшета/ноутбука Zalman ZM-NS2000	gallery	4	\N	web
2426	product_images/ohlazhdayuschaya-podstavka-dlya-planshetanoutbuka-zalman-zm-ns2000_8.jpg	f	840	Охлаждающая подставка для планшета/ноутбука Zalman ZM-NS2000	gallery	8	\N	web
2427	product_images/cpu-lga1700-intel-core-i3-14100-35-47ghz12mb-cache-l3emt644-cores_2.jpg	f	769	CPU LGA1700 Intel Core i3-14100 3.5-4.7GHz,12MB Cache L3,EMT64,4 Cores	gallery	2	\N	web
2428	product_images/cpu-lga1700-intel-core-i3-14100-35-47ghz12mb-cache-l3emt644-cores_5.jpg	f	769	CPU LGA1700 Intel Core i3-14100 3.5-4.7GHz,12MB Cache L3,EMT64,4 Cores	gallery	5	\N	web
2429	product_images/cpu-lga1700-intel-core-i3-14100-35-47ghz12mb-cache-l3emt644-cores_6.jpg	f	769	CPU LGA1700 Intel Core i3-14100 3.5-4.7GHz,12MB Cache L3,EMT64,4 Cores	gallery	6	\N	web
2430	product_images/hub-hikvision-8-port-10100_0.png	t	720	HUB HIKVISION 8-port 10/100	main	0	\N	web
2431	product_images/hub-hikvision-8-port-10100_3.png	f	720	HUB HIKVISION 8-port 10/100	gallery	3	\N	web
2432	product_images/hub-hikvision-8-port-10100_5.png	f	720	HUB HIKVISION 8-port 10/100	gallery	5	\N	web
2433	product_images/naushniki-s-mikrofonom-a4tech-bloody-g220-neon-gaming-35mm-usb-blac_1.jpg	f	698	Наушники с микрофоном A4Tech BLOODY G220 NEON Gaming 3.5mm & USB Blac	gallery	1	\N	web
2434	product_images/naushniki-s-mikrofonom-a4tech-bloody-g220-neon-gaming-35mm-usb-blac_4.jpg	f	698	Наушники с микрофоном A4Tech BLOODY G220 NEON Gaming 3.5mm & USB Blac	gallery	4	\N	web
2435	product_images/pen-drive-64gb-usb-20_0.jpg	t	564	PEN DRIVE 64GB USB 2,0	main	0	\N	web
2436	product_images/pen-drive-64gb-usb-20_1.jpg	f	564	PEN DRIVE 64GB USB 2,0	gallery	1	\N	web
2437	product_images/pen-drive-64gb-usb-20_2.jpg	f	564	PEN DRIVE 64GB USB 2,0	gallery	2	\N	web
2438	product_images/deepcool-matx-matrexx-55-wo-psu-1usb-30_2.jpg	f	539	DEEPCOOL MATX MATREXX 55 w/o PSU 1*USB 3.0	gallery	2	\N	web
2439	product_images/deepcool-matx-matrexx-55-wo-psu-1usb-30_6.jpg	f	539	DEEPCOOL MATX MATREXX 55 w/o PSU 1*USB 3.0	gallery	6	\N	web
2440	product_images/deepcool-matx-matrexx-55-wo-psu-1usb-30_8.jpg	f	539	DEEPCOOL MATX MATREXX 55 w/o PSU 1*USB 3.0	gallery	8	\N	web
2441	product_images/a4tech-fstyler-fg20-optical-mouse-wireless-2000dpi-blackgrey_3.jpg	f	648	A4TECH FSTYLER FG20 OPTICAL MOUSE WIRELESS 2000DPI BLACK/GREY	gallery	3	\N	web
2442	product_images/a4tech-fstyler-fg20-optical-mouse-wireless-2000dpi-blackgrey_6.jpg	f	648	A4TECH FSTYLER FG20 OPTICAL MOUSE WIRELESS 2000DPI BLACK/GREY	gallery	6	\N	web
2443	product_images/a4tech-fstyler-fg20-optical-mouse-wireless-2000dpi-blackgrey_7.jpg	f	648	A4TECH FSTYLER FG20 OPTICAL MOUSE WIRELESS 2000DPI BLACK/GREY	gallery	7	\N	web
2444	product_images/cable-vga-20m_3.jpg	f	517	Cable VGA 20м	gallery	3	\N	web
2445	product_images/cable-vga-20m_4.jpg	f	517	Cable VGA 20м	gallery	4	\N	web
2446	product_images/cable-vga-20m_6.jpg	f	517	Cable VGA 20м	gallery	6	\N	web
2447	product_images/sumka-dlya-noutbuka-rivacase-5517-156_2.png	f	858	Сумка для ноутбука RivaCase 5517 15.6"	gallery	2	\N	web
2448	product_images/sumka-dlya-noutbuka-rivacase-5517-156_6.webp	f	858	Сумка для ноутбука RivaCase 5517 15.6"	gallery	6	\N	web
2449	product_images/sumka-dlya-noutbuka-rivacase-5517-156_7.jpg	f	858	Сумка для ноутбука RivaCase 5517 15.6"	gallery	7	\N	web
2450	product_images/mfu-struynoe-epson-l3250-with-wi-fi-a4-printer-scanner-copier_6.jpg	f	766	МФУ струйное Epson L3250 with Wi-Fi A4, printer, scanner, copier	gallery	6	\N	web
2451	product_images/mfu-struynoe-epson-l3250-with-wi-fi-a4-printer-scanner-copier_7.jpg	f	766	МФУ струйное Epson L3250 with Wi-Fi A4, printer, scanner, copier	gallery	7	\N	web
2452	product_images/mfu-struynoe-epson-l3250-with-wi-fi-a4-printer-scanner-copier_8.jpg	f	766	МФУ струйное Epson L3250 with Wi-Fi A4, printer, scanner, copier	gallery	8	\N	web
2453	product_images/pad-rubber-s-kartinkoy-microsoft-obshitye_0.webp	t	680	Pad rubber с картинкой \\ microsoft обшитые	main	0	\N	web
2454	product_images/pad-rubber-s-kartinkoy-microsoft-obshitye_3.jpg	f	680	Pad rubber с картинкой \\ microsoft обшитые	gallery	3	\N	web
2455	product_images/pad-rubber-s-kartinkoy-microsoft-obshitye_4.webp	f	680	Pad rubber с картинкой \\ microsoft обшитые	gallery	4	\N	web
2456	product_images/hdd-1tb-toshiba-7200rpm-64mb-cache_1.jpg	f	574	HDD 1TB, Toshiba, 7200rpm, 64MB Cache	gallery	1	\N	web
2457	product_images/hdd-1tb-toshiba-7200rpm-64mb-cache_7.jpg	f	574	HDD 1TB, Toshiba, 7200rpm, 64MB Cache	gallery	7	\N	web
2458	product_images/hdd-1tb-toshiba-7200rpm-64mb-cache_8.jpg	f	574	HDD 1TB, Toshiba, 7200rpm, 64MB Cache	gallery	8	\N	web
2459	product_images/ryukzak-dlya-noutbuka-nr-value-156_2.webp	f	854	Рюкзак для ноутбука НР Value 15.6	gallery	2	\N	web
2460	product_images/ryukzak-dlya-noutbuka-nr-value-156_3.webp	f	854	Рюкзак для ноутбука НР Value 15.6	gallery	3	\N	web
2461	product_images/ryukzak-dlya-noutbuka-nr-value-156_5.jpg	f	854	Рюкзак для ноутбука НР Value 15.6	gallery	5	\N	web
2462	product_images/mouse-defender-doom-fighter-gm-260l-800-3200dpi-igrovaya-kovrik_1.jpg	f	663	Mouse Defender Doom Fighter GM-260L 800-3200dpi игровая+ коврик	gallery	1	\N	web
2463	product_images/mouse-defender-doom-fighter-gm-260l-800-3200dpi-igrovaya-kovrik_3.png	f	663	Mouse Defender Doom Fighter GM-260L 800-3200dpi игровая+ коврик	gallery	3	\N	web
2464	product_images/mouse-defender-doom-fighter-gm-260l-800-3200dpi-igrovaya-kovrik_8.jpg	f	663	Mouse Defender Doom Fighter GM-260L 800-3200dpi игровая+ коврик	gallery	8	\N	web
2465	product_images/kabel-dpi-15-m_1.jpg	f	525	Кабель DPI 1.5 м	gallery	1	\N	web
2466	product_images/kabel-dpi-15-m_4.jpg	f	525	Кабель DPI 1.5 м	gallery	4	\N	web
2467	product_images/kabel-dpi-15-m_5.png	f	525	Кабель DPI 1.5 м	gallery	5	\N	web
2468	product_images/pad-rubber-s-kartinkoy-microsoft-mini_0.jpg	t	678	Pad rubber с картинкой \\ microsoft - мини	main	0	\N	web
2469	product_images/pad-rubber-s-kartinkoy-microsoft-mini_3.jpg	f	678	Pad rubber с картинкой \\ microsoft - мини	gallery	3	\N	web
2470	product_images/pad-rubber-s-kartinkoy-microsoft-mini_4.webp	f	678	Pad rubber с картинкой \\ microsoft - мини	gallery	4	\N	web
2471	product_images/antivirus-drweb-security-space-1pk-6-mesyatsev_1.png	f	810	Антивирус Dr.Web Security Space 1пк \\ 6 месяцев	gallery	1	\N	web
2472	product_images/antivirus-drweb-security-space-1pk-6-mesyatsev_6.jpg	f	810	Антивирус Dr.Web Security Space 1пк \\ 6 месяцев	gallery	6	\N	web
2473	product_images/antivirus-drweb-security-space-1pk-6-mesyatsev_7.jpg	f	810	Антивирус Dr.Web Security Space 1пк \\ 6 месяцев	gallery	7	\N	web
2474	product_images/sumka-dlya-noutbuka-rivacase-5516-156_8.jpg	f	857	Сумка для ноутбука RivaCase 5516 15.6"	gallery	8	\N	web
2475	product_images/mb-lga1200-gigabyte-h510m-s2h-v22xddr412xusb4xsata3matxm2_0.webp	t	613	MB LGA1200 Gigabyte H510M S2H V2,2xDDR4,12xUSB,4xSATA3,mATX,M.2	main	0	\N	web
2476	product_images/mb-lga1200-gigabyte-h510m-s2h-v22xddr412xusb4xsata3matxm2_1.png	f	613	MB LGA1200 Gigabyte H510M S2H V2,2xDDR4,12xUSB,4xSATA3,mATX,M.2	gallery	1	\N	web
2477	product_images/mb-lga1200-gigabyte-h510m-s2h-v22xddr412xusb4xsata3matxm2_2.png	f	613	MB LGA1200 Gigabyte H510M S2H V2,2xDDR4,12xUSB,4xSATA3,mATX,M.2	gallery	2	\N	web
2478	product_images/kabel-hdmi-hdmi-15m_0.jpg	t	528	Кабель HDMI - HDMI 15m	main	0	\N	web
2479	product_images/kabel-hdmi-hdmi-15m_1.jpg	f	528	Кабель HDMI - HDMI 15m	gallery	1	\N	web
2480	product_images/kabel-hdmi-hdmi-15m_4.png	f	528	Кабель HDMI - HDMI 15m	gallery	4	\N	web
2481	product_images/ssd-512gb-western-digital-pc-sn5000s-m2-2280-nvme-pcie-gen4x4-read_3.jpg	f	583	SSD 512GB Western Digital PC SN5000S M.2 2280 NVMe PCIe Gen4x4 Read ,	gallery	3	\N	web
2482	product_images/ssd-512gb-western-digital-pc-sn5000s-m2-2280-nvme-pcie-gen4x4-read_5.jpg	f	583	SSD 512GB Western Digital PC SN5000S M.2 2280 NVMe PCIe Gen4x4 Read ,	gallery	5	\N	web
2483	product_images/a4tech-fstyler-fg35-optical-mouse-wireless-2000dpi-rozovaya_5.jpg	f	650	A4TECH FSTYLER FG35 OPTICAL MOUSE WIRELESS 2000DPI розовая	gallery	5	\N	web
2484	product_images/a4tech-fstyler-fg35-optical-mouse-wireless-2000dpi-rozovaya_7.jpg	f	650	A4TECH FSTYLER FG35 OPTICAL MOUSE WIRELESS 2000DPI розовая	gallery	7	\N	web
2485	product_images/hub-switch-tp-link-8-port-101001000_2.jpg	f	726	HUB Switch TP-Link 8-port 10/100/1000	gallery	2	\N	web
2486	product_images/hub-switch-tp-link-8-port-101001000_8.jpg	f	726	HUB Switch TP-Link 8-port 10/100/1000	gallery	8	\N	web
2487	product_images/secure-digital-card-micro-256mb_0.jpg	t	568	Secure Digital Card micro 256MB	main	0	\N	web
2488	product_images/secure-digital-card-micro-256mb_1.jpg	f	568	Secure Digital Card micro 256MB	gallery	1	\N	web
2489	product_images/secure-digital-card-micro-256mb_3.jpg	f	568	Secure Digital Card micro 256MB	gallery	3	\N	web
2490	product_images/antivirus-kasperskiy_0.jpg	t	814	Антивирус Касперский	main	0	\N	web
2491	product_images/antivirus-kasperskiy_2.jpg	f	814	Антивирус Касперский	gallery	2	\N	web
2492	product_images/antivirus-kasperskiy_3.jpg	f	814	Антивирус Касперский	gallery	3	\N	web
2493	product_images/power-supply-aerocool-vx-400-plus-400w-atx-passive-pfc-204-pin-4_0.jpg	t	754	Power Supply Aerocool VX-400 PLUS, 400W, ATX, Passive-PFC, 20+4 pin, 4	main	0	\N	web
2494	product_images/power-supply-aerocool-vx-400-plus-400w-atx-passive-pfc-204-pin-4_1.jpg	f	754	Power Supply Aerocool VX-400 PLUS, 400W, ATX, Passive-PFC, 20+4 pin, 4	gallery	1	\N	web
2495	product_images/power-supply-aerocool-vx-400-plus-400w-atx-passive-pfc-204-pin-4_3.jpg	f	754	Power Supply Aerocool VX-400 PLUS, 400W, ATX, Passive-PFC, 20+4 pin, 4	gallery	3	\N	web
2496	product_images/cooler-12-sm-s-podsvetkoy_0.jpg	t	544	Cooler 12 см с подсветкой	main	0	\N	web
2497	product_images/cooler-12-sm-s-podsvetkoy_1.jpg	f	544	Cooler 12 см с подсветкой	gallery	1	\N	web
2498	product_images/cooler-12-sm-s-podsvetkoy_3.jpg	f	544	Cooler 12 см с подсветкой	gallery	3	\N	web
2499	product_images/speakers-microlab-b-55-v2-20-usb-1w-black_1.jpg	f	791	Speakers Microlab B-55 (V2) 2.0 USB 1W BLACK	gallery	1	\N	web
2500	product_images/speakers-microlab-b-55-v2-20-usb-1w-black_6.jpg	f	791	Speakers Microlab B-55 (V2) 2.0 USB 1W BLACK	gallery	6	\N	web
2501	product_images/pad-rubber-s-kartinkoy-microsoft_0.jpg	t	677	Pad rubber с картинкой \\ microsoft	main	0	\N	web
2502	product_images/pad-rubber-s-kartinkoy-microsoft_3.webp	f	677	Pad rubber с картинкой \\ microsoft	gallery	3	\N	web
2503	product_images/pad-rubber-s-kartinkoy-microsoft_4.jpg	f	677	Pad rubber с картинкой \\ microsoft	gallery	4	\N	web
2504	product_images/mouse-defender-skull-gm-180l-optika6knopok800-3200dpi-igrovaya_0.jpg	t	666	Mouse Defender Skull GM-180L оптика,6кнопок,800-3200dpi игровая	main	0	\N	web
2505	product_images/mouse-defender-skull-gm-180l-optika6knopok800-3200dpi-igrovaya_2.jpg	f	666	Mouse Defender Skull GM-180L оптика,6кнопок,800-3200dpi игровая	gallery	2	\N	web
2506	product_images/mouse-defender-skull-gm-180l-optika6knopok800-3200dpi-igrovaya_3.jpg	f	666	Mouse Defender Skull GM-180L оптика,6кнопок,800-3200dpi игровая	gallery	3	\N	web
2507	product_images/speakers-sven-312-chernyy-rms-4vt-minijack-35mm_2.jpg	f	793	Speakers SVEN 312 черный, RMS 4Вт, miniJack 3.5mm	gallery	2	\N	web
2508	product_images/speakers-sven-312-chernyy-rms-4vt-minijack-35mm_8.jpg	f	793	Speakers SVEN 312 черный, RMS 4Вт, miniJack 3.5mm	gallery	8	\N	web
2509	product_images/ddr4-8gb-pc-21333-hikvisioncrusialzeppelin_1.jpg	f	619	DDR4 8GB PC-21333 - Hikvision\\Crusial/Zeppelin	gallery	1	\N	web
2510	product_images/ddr4-8gb-pc-21333-hikvisioncrusialzeppelin_2.jpg	f	619	DDR4 8GB PC-21333 - Hikvision\\Crusial/Zeppelin	gallery	2	\N	web
2511	product_images/ddr4-8gb-pc-21333-hikvisioncrusialzeppelin_3.jpg	f	619	DDR4 8GB PC-21333 - Hikvision\\Crusial/Zeppelin	gallery	3	\N	web
2512	product_images/kovrik-a4tech-fstyler-fp25-mouse-pad-250x200x2mm_4.png	f	682	Коврик A4TECH FSTYLER FP25 MOUSE PAD 250x200x2mm	gallery	4	\N	web
2513	product_images/kovrik-a4tech-fstyler-fp25-mouse-pad-250x200x2mm_6.jpg	f	682	Коврик A4TECH FSTYLER FP25 MOUSE PAD 250x200x2mm	gallery	6	\N	web
2514	product_images/pen-drive-128gb-usb-3132_0.jpg	t	562	PEN DRIVE 128GB USB 3.1\\3.2	main	0	\N	web
2515	product_images/pen-drive-128gb-usb-3132_1.jpg	f	562	PEN DRIVE 128GB USB 3.1\\3.2	gallery	1	\N	web
2516	product_images/pen-drive-128gb-usb-3132_2.jpg	f	562	PEN DRIVE 128GB USB 3.1\\3.2	gallery	2	\N	web
2517	product_images/asus-prime-h310m-r-lga1151-intel-h310-2xddr4-hdmi_0.webp	t	608	Asus Prime H310M-R, LGA1151, Intel H310, 2xDDR4, HDMI	main	0	\N	web
2518	product_images/asus-prime-h310m-r-lga1151-intel-h310-2xddr4-hdmi_2.jpg	f	608	Asus Prime H310M-R, LGA1151, Intel H310, 2xDDR4, HDMI	gallery	2	\N	web
2519	product_images/asus-prime-h310m-r-lga1151-intel-h310-2xddr4-hdmi_4.jpg	f	608	Asus Prime H310M-R, LGA1151, Intel H310, 2xDDR4, HDMI	gallery	4	\N	web
2520	product_images/cpu-lga1700-intel-core-i3-12100-33-43ghz12mb-cache-l3emt644-cores_1.jpg	f	768	CPU LGA1700 Intel Core i3-12100 3.3-4.3GHz,12MB Cache L3,EMT64,4 Cores	gallery	1	\N	web
2521	product_images/cpu-lga1700-intel-core-i3-12100-33-43ghz12mb-cache-l3emt644-cores_3.jpg	f	768	CPU LGA1700 Intel Core i3-12100 3.3-4.3GHz,12MB Cache L3,EMT64,4 Cores	gallery	3	\N	web
2522	product_images/cpu-lga1700-intel-core-i3-12100-33-43ghz12mb-cache-l3emt644-cores_4.jpg	f	768	CPU LGA1700 Intel Core i3-12100 3.3-4.3GHz,12MB Cache L3,EMT64,4 Cores	gallery	4	\N	web
2523	product_images/sumka-dlya-noutbuka-rivacase-7532-156_1.jpg	f	860	Сумка для ноутбука RivaCase 7532 15,6"	gallery	1	\N	web
2524	product_images/sumka-dlya-noutbuka-rivacase-7532-156_5.webp	f	860	Сумка для ноутбука RivaCase 7532 15,6"	gallery	5	\N	web
2525	product_images/sumka-dlya-noutbuka-rivacase-7532-156_6.jpg	f	860	Сумка для ноутбука RivaCase 7532 15,6"	gallery	6	\N	web
2526	product_images/external-hdd-1tb-adata-xpg-ex500-5400rpm-usb-31_0.jpg	t	572	External HDD 1TB ADATA XPG EX500 (5400RPM, USB 3.1)	main	0	\N	web
2527	product_images/external-hdd-1tb-adata-xpg-ex500-5400rpm-usb-31_4.jpg	f	572	External HDD 1TB ADATA XPG EX500 (5400RPM, USB 3.1)	gallery	4	\N	web
2528	product_images/external-hdd-1tb-adata-xpg-ex500-5400rpm-usb-31_5.jpg	f	572	External HDD 1TB ADATA XPG EX500 (5400RPM, USB 3.1)	gallery	5	\N	web
2529	product_images/microlab-subwoofer-m-223ii-21-17w-9w4w2-black_4.jpg	f	780	Microlab Subwoofer M-223II 2.1 17W (9W+4W*2) BLACK	gallery	4	\N	web
2530	product_images/psu-jump-atx-650-p4-total-650w-80-bronze-certifed_1.jpg	f	760	PSU Jump ATX 650-P4 (total 650W) 80+ Bronze certifed	gallery	1	\N	web
2531	product_images/psu-jump-atx-650-p4-total-650w-80-bronze-certifed_3.jpg	f	760	PSU Jump ATX 650-P4 (total 650W) 80+ Bronze certifed	gallery	3	\N	web
2532	product_images/psu-jump-atx-650-p4-total-650w-80-bronze-certifed_4.jpg	f	760	PSU Jump ATX 650-P4 (total 650W) 80+ Bronze certifed	gallery	4	\N	web
2533	product_images/stul-krutyaschiysya-dermantinovyy-s-vysokoy-spinkoy-6009_1.jpg	f	829	Стул крутящийся - дермантиновый с высокой спинкой (6009)	gallery	1	\N	web
2534	product_images/stul-krutyaschiysya-dermantinovyy-s-vysokoy-spinkoy-6009_3.jpg	f	829	Стул крутящийся - дермантиновый с высокой спинкой (6009)	gallery	3	\N	web
2535	product_images/stul-krutyaschiysya-dermantinovyy-s-vysokoy-spinkoy-6009_6.jpg	f	829	Стул крутящийся - дермантиновый с высокой спинкой (6009)	gallery	6	\N	web
2536	product_images/usb-zvukovaya-karta_0.jpg	t	495	USB звуковая карта	main	0	\N	web
2537	product_images/usb-zvukovaya-karta_1.jpg	f	495	USB звуковая карта	gallery	1	\N	web
2538	product_images/usb-zvukovaya-karta_2.jpg	f	495	USB звуковая карта	gallery	2	\N	web
2539	product_images/gigabyte-h610m-n-ddr4-lga1700-intel-h610-2xddr4-pc25600-1xpci-e16x_0.jpg	t	611	Gigabyte H610M Н DDR4, LGA1700, Intel H610, 2xDDR4 PC25600, 1xPCI-E16X	main	0	\N	web
2540	product_images/gigabyte-h610m-n-ddr4-lga1700-intel-h610-2xddr4-pc25600-1xpci-e16x_1.jpg	f	611	Gigabyte H610M Н DDR4, LGA1700, Intel H610, 2xDDR4 PC25600, 1xPCI-E16X	gallery	1	\N	web
2541	product_images/gigabyte-h610m-n-ddr4-lga1700-intel-h610-2xddr4-pc25600-1xpci-e16x_2.jpg	f	611	Gigabyte H610M Н DDR4, LGA1700, Intel H610, 2xDDR4 PC25600, 1xPCI-E16X	gallery	2	\N	web
2542	product_images/mouse-winstar-razeak-rm-015-gaming_1.jpg	f	671	Mouse Winstar Razeak RM-015 Gaming	gallery	1	\N	web
2543	product_images/mouse-winstar-razeak-rm-015-gaming_5.jpg	f	671	Mouse Winstar Razeak RM-015 Gaming	gallery	5	\N	web
2544	product_images/mouse-winstar-razeak-rm-015-gaming_6.jpg	f	671	Mouse Winstar Razeak RM-015 Gaming	gallery	6	\N	web
2545	product_images/ddr4-16gb-pc-25600-3200mhz-hikvision_5.jpg	f	618	DDR4 16GB PC-25600 (3200Mhz) HIKVISION	gallery	5	\N	web
2546	product_images/ddr4-16gb-pc-25600-3200mhz-hikvision_7.png	f	618	DDR4 16GB PC-25600 (3200Mhz) HIKVISION	gallery	7	\N	web
2547	product_images/ddr4-16gb-pc-25600-3200mhz-hikvision_8.jpg	f	618	DDR4 16GB PC-25600 (3200Mhz) HIKVISION	gallery	8	\N	web
2548	product_images/mouse-genius-dx-150h-usb-optical_2.png	f	668	Mouse Genius DX-150Х USB Optical	gallery	2	\N	web
2549	product_images/mouse-genius-dx-150h-usb-optical_4.jpg	f	668	Mouse Genius DX-150Х USB Optical	gallery	4	\N	web
2550	product_images/mouse-genius-dx-150h-usb-optical_5.jpg	f	668	Mouse Genius DX-150Х USB Optical	gallery	5	\N	web
2551	product_images/speakers-microlab-b-26-4w-20-usb_0.jpg	t	790	Speakers Microlab B-26 4W 2.0 USB	main	0	\N	web
2552	product_images/setevoy-filtr-era-bazovaya-zaschita-6gn-3-m-pvs-10a-sz-s-vykl-belyycher_2.jpg	f	561	Сетевой фильтр ЭРА базовая защита 6гн 3 м ПВС 10А с/з с выкл белый\\чер	gallery	2	\N	web
2553	product_images/setevoy-filtr-era-bazovaya-zaschita-6gn-3-m-pvs-10a-sz-s-vykl-belyycher_4.jpg	f	561	Сетевой фильтр ЭРА базовая защита 6гн 3 м ПВС 10А с/з с выкл белый\\чер	gallery	4	\N	web
2554	product_images/setevoy-filtr-era-bazovaya-zaschita-6gn-3-m-pvs-10a-sz-s-vykl-belyycher_5.jpg	f	561	Сетевой фильтр ЭРА базовая защита 6гн 3 м ПВС 10А с/з с выкл белый\\чер	gallery	5	\N	web
2555	product_images/cable-usb-5-m-udlinitel-ekranir_0.jpg	t	510	Cable USB 5 m (удлинитель) экранир	main	0	\N	web
2556	product_images/cable-usb-5-m-udlinitel-ekranir_1.jpg	f	510	Cable USB 5 m (удлинитель) экранир	gallery	1	\N	web
2557	product_images/cable-usb-5-m-udlinitel-ekranir_4.jpg	f	510	Cable USB 5 m (удлинитель) экранир	gallery	4	\N	web
2558	product_images/acer-aspire-lite-ryzen-5-7430u-23-43ghz16gbssd-512gbrx-vega-7-15_1.jpg	f	747	Acer Aspire Lite Ryzen 5 7430U 2.3-4.3GHz,16GB,SSD 512GB,RX VEGA 7, 15	gallery	1	\N	web
2559	product_images/acer-aspire-lite-ryzen-5-7430u-23-43ghz16gbssd-512gbrx-vega-7-15_3.jpg	f	747	Acer Aspire Lite Ryzen 5 7430U 2.3-4.3GHz,16GB,SSD 512GB,RX VEGA 7, 15	gallery	3	\N	web
2560	product_images/acer-aspire-lite-ryzen-5-7430u-23-43ghz16gbssd-512gbrx-vega-7-15_4.jpg	f	747	Acer Aspire Lite Ryzen 5 7430U 2.3-4.3GHz,16GB,SSD 512GB,RX VEGA 7, 15	gallery	4	\N	web
2561	product_images/cpu-lga1700-intel-core-i5-13400-lga1700-18-460ghz-6xcores_1.jpg	f	771	CPU LGA1700 Intel Core i5-13400, LGA1700, 1.8-4.60GHz, 6xCores	gallery	1	\N	web
2562	product_images/cpu-lga1700-intel-core-i5-13400-lga1700-18-460ghz-6xcores_3.jpg	f	771	CPU LGA1700 Intel Core i5-13400, LGA1700, 1.8-4.60GHz, 6xCores	gallery	3	\N	web
2563	product_images/cpu-lga1700-intel-core-i5-13400-lga1700-18-460ghz-6xcores_4.webp	f	771	CPU LGA1700 Intel Core i5-13400, LGA1700, 1.8-4.60GHz, 6xCores	gallery	4	\N	web
2564	product_images/hdd-1000gb-5400rpm-wdseagate-sata_1.jpg	f	573	HDD 1000GB 5400rpm WD\\Seagate SATA	gallery	1	\N	web
2565	product_images/hdd-1000gb-5400rpm-wdseagate-sata_2.jpg	f	573	HDD 1000GB 5400rpm WD\\Seagate SATA	gallery	2	\N	web
2566	product_images/hdd-1000gb-5400rpm-wdseagate-sata_3.jpg	f	573	HDD 1000GB 5400rpm WD\\Seagate SATA	gallery	3	\N	web
2567	product_images/sumka-dlya-noutbuka-rivacase-8038-black-156-myshka_1.jpg	f	864	Сумка для ноутбука RivaCase 8038 Black 15,6" + мышка!!!	gallery	1	\N	web
2568	product_images/sumka-dlya-noutbuka-rivacase-8038-black-156-myshka_4.jpg	f	864	Сумка для ноутбука RivaCase 8038 Black 15,6" + мышка!!!	gallery	4	\N	web
2569	product_images/sumka-dlya-noutbuka-rivacase-8038-black-156-myshka_7.png	f	864	Сумка для ноутбука RivaCase 8038 Black 15,6" + мышка!!!	gallery	7	\N	web
2570	product_images/wireless-adapter-tp-link-tl-wn781nd-n150-mbs-24ghz1antena-pce-ex_2.jpg	f	731	Wireless Adapter TP-Link TL-WN781ND N150 Mb/s, 2.4Ghz1антена PCE Ex	gallery	2	\N	web
2571	product_images/wireless-adapter-tp-link-tl-wn781nd-n150-mbs-24ghz1antena-pce-ex_3.jpg	f	731	Wireless Adapter TP-Link TL-WN781ND N150 Mb/s, 2.4Ghz1антена PCE Ex	gallery	3	\N	web
2572	product_images/power-cable-1m-chernyy_0.jpg	t	522	Power cable 1м черный	main	0	\N	web
2573	product_images/power-cable-1m-chernyy_1.png	f	522	Power cable 1м черный	gallery	1	\N	web
2574	product_images/power-cable-1m-chernyy_2.jpg	f	522	Power cable 1м черный	gallery	2	\N	web
2575	product_images/acer-aspire-al15-32p-lite-n4500-8gb-256gb-ssd-m2-nvme-pcie_0.jpg	t	746	Acer Aspire AL15-32P Lite N4500 8GB, 256GB SSD M.2 NVMe PCIe	main	0	\N	web
2576	product_images/acer-aspire-al15-32p-lite-n4500-8gb-256gb-ssd-m2-nvme-pcie_1.jpg	f	746	Acer Aspire AL15-32P Lite N4500 8GB, 256GB SSD M.2 NVMe PCIe	gallery	1	\N	web
2577	product_images/acer-aspire-al15-32p-lite-n4500-8gb-256gb-ssd-m2-nvme-pcie_2.jpg	f	746	Acer Aspire AL15-32P Lite N4500 8GB, 256GB SSD M.2 NVMe PCIe	gallery	2	\N	web
2578	product_images/a4tech-bloody-v7m-igrovaya-opticheskaya-3200dpii-8-knopok-provodnaya_0.jpg	t	645	A4Tech Bloody V7M, Игровая, Оптическая 3200dpii, 8 кнопок, Проводная,	main	0	\N	web
2579	product_images/a4tech-bloody-v7m-igrovaya-opticheskaya-3200dpii-8-knopok-provodnaya_6.jpg	f	645	A4Tech Bloody V7M, Игровая, Оптическая 3200dpii, 8 кнопок, Проводная,	gallery	6	\N	web
2580	product_images/keyboard-aeromax-kb-509-black-rus-usb_0.jpg	t	597	Keyboard Aeromax KB-509 BLACK RUS USB	main	0	\N	web
2581	product_images/keyboard-aeromax-kb-509-black-rus-usb_3.jpg	f	597	Keyboard Aeromax KB-509 BLACK RUS USB	gallery	3	\N	web
2582	product_images/keyboard-aeromax-kb-509-black-rus-usb_7.jpg	f	597	Keyboard Aeromax KB-509 BLACK RUS USB	gallery	7	\N	web
2583	product_images/akusticheskaya-sistema-21-sven-ms-80-chernyy_1.jpg	f	797	Акустическая система 2.1 SVEN MS-80 черный	gallery	1	\N	web
2584	product_images/akusticheskaya-sistema-21-sven-ms-80-chernyy_2.jpg	f	797	Акустическая система 2.1 SVEN MS-80 черный	gallery	2	\N	web
2585	product_images/keyboard-delux-k6850u-m362bu-keyboardmouse-black-usb-ruskg_4.jpg	f	598	Keyboard Delux K6850U +М362BU keyboard+mouse black USB RUS+KG	gallery	4	\N	web
2586	product_images/keyboard-delux-k6850u-m362bu-keyboardmouse-black-usb-ruskg_5.jpg	f	598	Keyboard Delux K6850U +М362BU keyboard+mouse black USB RUS+KG	gallery	5	\N	web
2587	product_images/keyboard-delux-k6850u-m362bu-keyboardmouse-black-usb-ruskg_6.png	f	598	Keyboard Delux K6850U +М362BU keyboard+mouse black USB RUS+KG	gallery	6	\N	web
2588	product_images/kreslo-krutyaschiesya-kachayuschiesya-kozha-dorogoy-dutysh-na-120-kg_0.jpg	t	824	Кресло крутящиеся - качающиеся кожа - дорогой дутыш на 120 кг	main	0	\N	web
2589	product_images/kreslo-krutyaschiesya-kachayuschiesya-kozha-dorogoy-dutysh-na-120-kg_1.jpg	f	824	Кресло крутящиеся - качающиеся кожа - дорогой дутыш на 120 кг	gallery	1	\N	web
2590	product_images/kreslo-krutyaschiesya-kachayuschiesya-kozha-dorogoy-dutysh-na-120-kg_5.jpg	f	824	Кресло крутящиеся - качающиеся кожа - дорогой дутыш на 120 кг	gallery	5	\N	web
2591	product_images/microlab-subwoofer-m-108bt-21-11w-6w25w2-black_1.jpg	f	776	Microlab Subwoofer M-108BT 2.1 11W (6W+2.5W*2) BLACK	gallery	1	\N	web
2592	product_images/microlab-subwoofer-m-108bt-21-11w-6w25w2-black_3.jpg	f	776	Microlab Subwoofer M-108BT 2.1 11W (6W+2.5W*2) BLACK	gallery	3	\N	web
2593	product_images/microlab-subwoofer-m-108bt-21-11w-6w25w2-black_5.jpg	f	776	Microlab Subwoofer M-108BT 2.1 11W (6W+2.5W*2) BLACK	gallery	5	\N	web
2594	product_images/a4tech-fstyler-fg30-optical-mouse-wireless-2000dpi-blackgrey_8.jpg	f	649	A4TECH FSTYLER FG30 OPTICAL MOUSE WIRELESS 2000DPI BLACK/GREY	gallery	8	\N	web
2595	product_images/a4tech-n-310-v-track-notebook-mouse-usb-blackorange_5.jpg	f	634	A4TECH N-310 V-TRACK NOTEBOOK MOUSE USB BLACK/ORANGE	gallery	5	\N	web
2596	product_images/sumka-dlya-noutbuka-rivacase-7531-156-16_0.jpg	t	859	Сумка для ноутбука RivaCase 7531 15,6"-16"	main	0	\N	web
2597	product_images/sumka-dlya-noutbuka-rivacase-7531-156-16_1.jpg	f	859	Сумка для ноутбука RivaCase 7531 15,6"-16"	gallery	1	\N	web
2598	product_images/sumka-dlya-noutbuka-rivacase-7531-156-16_2.jpg	f	859	Сумка для ноутбука RivaCase 7531 15,6"-16"	gallery	2	\N	web
2599	product_images/mouse-a4tech-g3-280n-v-track-black-1000-dpi-usb-padless-wireless_3.jpg	f	659	Mouse A4Tech G3-280N V-Track, Black, 1000 dpi, USB, padless wireless	gallery	3	\N	web
2600	product_images/mouse-a4tech-g3-280n-v-track-black-1000-dpi-usb-padless-wireless_6.jpg	f	659	Mouse A4Tech G3-280N V-Track, Black, 1000 dpi, USB, padless wireless	gallery	6	\N	web
2601	product_images/mouse-a4tech-g3-280n-v-track-black-1000-dpi-usb-padless-wireless_8.jpg	f	659	Mouse A4Tech G3-280N V-Track, Black, 1000 dpi, USB, padless wireless	gallery	8	\N	web
2602	product_images/speakers-microlab-b-15-6w-20-usb_1.webp	f	787	Speakers Microlab B-15 6W 2.0 USB	gallery	1	\N	web
2603	product_images/speakers-microlab-b-15-6w-20-usb_2.jpg	f	787	Speakers Microlab B-15 6W 2.0 USB	gallery	2	\N	web
2604	product_images/speakers-microlab-b-15-6w-20-usb_4.jpg	f	787	Speakers Microlab B-15 6W 2.0 USB	gallery	4	\N	web
2605	product_images/ssd-kioxia-toshiba-bg6-512gb-pcie-nvme-gen4x4-m2-2280_0.png	t	584	SSD KIOXIA (Toshiba) BG6 512GB PCIe NVMe Gen4x4, M.2 2280	main	0	\N	web
2606	product_images/klaviatura-mysh-genius-smart-km-200-usb-chernyy_0.jpg	t	602	Клавиатура + мышь Genius Smart KM-200 USB черный	main	0	\N	web
2607	product_images/klaviatura-mysh-genius-smart-km-200-usb-chernyy_1.jpg	f	602	Клавиатура + мышь Genius Smart KM-200 USB черный	gallery	1	\N	web
2608	product_images/klaviatura-mysh-genius-smart-km-200-usb-chernyy_2.jpg	f	602	Клавиатура + мышь Genius Smart KM-200 USB черный	gallery	2	\N	web
2609	product_images/perehodnik-hdmi-papa-hdmi-mama-mini_2.jpg	f	503	Переходник HDMI папа - HDMI мама мини	gallery	2	\N	web
2610	product_images/speakers-sven-255_4.jpg	f	792	Speakers SVEN 255	gallery	4	\N	web
2611	product_images/speakers-sven-255_5.webp	f	792	Speakers SVEN 255	gallery	5	\N	web
2612	product_images/speakers-sven-255_7.jpg	f	792	Speakers SVEN 255	gallery	7	\N	web
2613	product_images/microlab-subwoofer-u-220-rgb-21-black-10w-25wx2-5w-usb-bluetoot_2.jpg	f	784	Microlab Subwoofer U-220 RGB 2.1 BLACK 10W (2.5Wx2 + 5W) USB, Bluetoot	gallery	2	\N	web
2614	product_images/microlab-subwoofer-u-220-rgb-21-black-10w-25wx2-5w-usb-bluetoot_5.webp	f	784	Microlab Subwoofer U-220 RGB 2.1 BLACK 10W (2.5Wx2 + 5W) USB, Bluetoot	gallery	5	\N	web
2615	product_images/microlab-subwoofer-u-220-rgb-21-black-10w-25wx2-5w-usb-bluetoot_6.webp	f	784	Microlab Subwoofer U-220 RGB 2.1 BLACK 10W (2.5Wx2 + 5W) USB, Bluetoot	gallery	6	\N	web
2616	product_images/a4tech-bloody-b760-light-strike-gaming-mechanical-neon_0.jpg	t	592	A4TECH BLOODY B760 LIGHT STRIKE GAMING MECHANICAL NEON	main	0	\N	web
2617	product_images/a4tech-bloody-b760-light-strike-gaming-mechanical-neon_1.jpg	f	592	A4TECH BLOODY B760 LIGHT STRIKE GAMING MECHANICAL NEON	gallery	1	\N	web
2618	product_images/a4tech-bloody-b760-light-strike-gaming-mechanical-neon_2.jpg	f	592	A4TECH BLOODY B760 LIGHT STRIKE GAMING MECHANICAL NEON	gallery	2	\N	web
2619	product_images/lenovo-v15-g4-i3-1315u-12-45ghz8gbssd-256gb156fhd-rus-black_0.jpg	t	753	Lenovo V15 G4 i3-1315U 1.2-4.5GHz,8GB,SSD 256GB,15.6"FHD RUS BLACK	main	0	\N	web
2620	product_images/lenovo-v15-g4-i3-1315u-12-45ghz8gbssd-256gb156fhd-rus-black_1.jpg	f	753	Lenovo V15 G4 i3-1315U 1.2-4.5GHz,8GB,SSD 256GB,15.6"FHD RUS BLACK	gallery	1	\N	web
2621	product_images/lenovo-v15-g4-i3-1315u-12-45ghz8gbssd-256gb156fhd-rus-black_3.jpg	f	753	Lenovo V15 G4 i3-1315U 1.2-4.5GHz,8GB,SSD 256GB,15.6"FHD RUS BLACK	gallery	3	\N	web
2622	product_images/adata-external-usb-3031-dlya-vinchesterov-ssd_1.png	f	491	ADATA External USB 3.0\\3.1 (для винчестеров SSD)	gallery	1	\N	web
2623	product_images/adata-external-usb-3031-dlya-vinchesterov-ssd_2.png	f	491	ADATA External USB 3.0\\3.1 (для винчестеров SSD)	gallery	2	\N	web
2624	product_images/adata-external-usb-3031-dlya-vinchesterov-ssd_3.png	f	491	ADATA External USB 3.0\\3.1 (для винчестеров SSD)	gallery	3	\N	web
2625	product_images/power-unit-delux-dlp-35d-480w360a204pin2sata3big-4pin1small-4_0.jpg	t	757	Power Unit DELUX DLP-35D 480W(360A)20+4PIN,2*SATA,3*big 4pin,1*small 4	main	0	\N	web
2626	product_images/power-unit-delux-dlp-35d-480w360a204pin2sata3big-4pin1small-4_1.jpg	f	757	Power Unit DELUX DLP-35D 480W(360A)20+4PIN,2*SATA,3*big 4pin,1*small 4	gallery	1	\N	web
2627	product_images/power-unit-delux-dlp-35d-480w360a204pin2sata3big-4pin1small-4_2.jpg	f	757	Power Unit DELUX DLP-35D 480W(360A)20+4PIN,2*SATA,3*big 4pin,1*small 4	gallery	2	\N	web
2628	product_images/microlab-subwoofer-m-500u-21-40w16212-usbsd-card-black_0.webp	t	783	Microlab Subwoofer M-500U/ 2.1 40W(16+2*12) USB/SD CARD BLACK	main	0	\N	web
2629	product_images/microlab-subwoofer-m-500u-21-40w16212-usbsd-card-black_1.jpg	f	783	Microlab Subwoofer M-500U/ 2.1 40W(16+2*12) USB/SD CARD BLACK	gallery	1	\N	web
2630	product_images/microlab-subwoofer-m-500u-21-40w16212-usbsd-card-black_2.jpg	f	783	Microlab Subwoofer M-500U/ 2.1 40W(16+2*12) USB/SD CARD BLACK	gallery	2	\N	web
2631	product_images/microlab-speakers-b-16-25w-20-usb_0.jpg	t	773	Microlab Speakers B-16 2.5W 2.0 USB	main	0	\N	web
2632	product_images/microlab-speakers-b-16-25w-20-usb_1.jpg	f	773	Microlab Speakers B-16 2.5W 2.0 USB	gallery	1	\N	web
2633	product_images/microlab-speakers-b-16-25w-20-usb_2.jpg	f	773	Microlab Speakers B-16 2.5W 2.0 USB	gallery	2	\N	web
2634	product_images/kabel-hdmi-hdmi-10m_0.jpg	t	527	Кабель HDMI - HDMI 10m	main	0	\N	web
2635	product_images/kabel-hdmi-hdmi-10m_1.png	f	527	Кабель HDMI - HDMI 10m	gallery	1	\N	web
2636	product_images/kabel-hdmi-hdmi-10m_2.jpg	f	527	Кабель HDMI - HDMI 10m	gallery	2	\N	web
2637	product_images/akkamulyator-dlya-ups-12v-9a-delta_4.jpg	f	808	Аккамулятор для UPS 12V \\ 9A Delta	gallery	4	\N	web
2638	product_images/akkamulyator-dlya-ups-12v-9a-delta_5.jpg	f	808	Аккамулятор для UPS 12V \\ 9A Delta	gallery	5	\N	web
2639	product_images/akkamulyator-dlya-ups-12v-9a-delta_6.jpg	f	808	Аккамулятор для UPS 12V \\ 9A Delta	gallery	6	\N	web
2640	product_images/besprovodnaya-kolonka-edifier-mp85-85dba-50bt-22w-chernyy_1.jpg	f	798	Беспроводная колонка Edifier MP85 , ,85dB(A), 5.0BT, 2.2W, Черный	gallery	1	\N	web
2641	product_images/besprovodnaya-kolonka-edifier-mp85-85dba-50bt-22w-chernyy_5.jpg	f	798	Беспроводная колонка Edifier MP85 , ,85dB(A), 5.0BT, 2.2W, Черный	gallery	5	\N	web
2642	product_images/besprovodnaya-kolonka-edifier-mp85-85dba-50bt-22w-chernyy_6.jpg	f	798	Беспроводная колонка Edifier MP85 , ,85dB(A), 5.0BT, 2.2W, Черный	gallery	6	\N	web
2643	product_images/podstavka-dlya-naushnikov-a4tech-bloody-gs2l-usb-rgb-150cm-cable_5.jpg	f	711	Подставка для наушников A4TECH BLOODY GS2L USB RGB, 150cm cable	gallery	5	\N	web
2644	product_images/stul-ofisnyy-prostoy-rossiya_1.jpg	f	832	Стул офисный - простой (Россия)	gallery	1	\N	web
2645	product_images/stul-ofisnyy-prostoy-rossiya_2.jpg	f	832	Стул офисный - простой (Россия)	gallery	2	\N	web
2646	product_images/stul-ofisnyy-prostoy-rossiya_3.jpg	f	832	Стул офисный - простой (Россия)	gallery	3	\N	web
2647	product_images/hp-15-amd-ryzen-3-7320u156-led-full-hd-8gb-lpddr5-5500mhz-256gb-s_4.jpg	f	749	HP 15 AMD Ryzen 3 7320U,15.6" LED FULL HD, 8GB LPDDR5-5500MHz, 256GB S	gallery	4	\N	web
2648	product_images/hp-15-amd-ryzen-3-7320u156-led-full-hd-8gb-lpddr5-5500mhz-256gb-s_5.jpg	f	749	HP 15 AMD Ryzen 3 7320U,15.6" LED FULL HD, 8GB LPDDR5-5500MHz, 256GB S	gallery	5	\N	web
2649	product_images/cpu-lga1700-intel-core-i5-14400-lga1700-18-470ghz-6xcores_0.jpg	t	772	CPU LGA1700 Intel Core i5-14400, LGA1700, 1.8-4.70GHz, 6xCores	main	0	\N	web
2650	product_images/cpu-lga1700-intel-core-i5-14400-lga1700-18-470ghz-6xcores_2.jpg	f	772	CPU LGA1700 Intel Core i5-14400, LGA1700, 1.8-4.70GHz, 6xCores	gallery	2	\N	web
2651	product_images/cpu-lga1700-intel-core-i5-14400-lga1700-18-470ghz-6xcores_3.png	f	772	CPU LGA1700 Intel Core i5-14400, LGA1700, 1.8-4.70GHz, 6xCores	gallery	3	\N	web
2652	product_images/cooler-p3_0.jpg	t	548	Cooler P3	main	0	\N	web
2653	product_images/cooler-p3_1.jpg	f	548	Cooler P3	gallery	1	\N	web
2654	product_images/cooler-p3_2.png	f	548	Cooler P3	gallery	2	\N	web
2655	product_images/deepcool-matx-matrexx-30-wo-psu-1usb-30-glass-front-panel-fully-bl_0.jpg	t	538	DEEPCOOL MATX MATREXX 30 w/o PSU 1*USB 3.0 Glass front panel Fully bl	main	0	\N	web
2656	product_images/deepcool-matx-matrexx-30-wo-psu-1usb-30-glass-front-panel-fully-bl_2.jpg	f	538	DEEPCOOL MATX MATREXX 30 w/o PSU 1*USB 3.0 Glass front panel Fully bl	gallery	2	\N	web
2657	product_images/deepcool-matx-matrexx-30-wo-psu-1usb-30-glass-front-panel-fully-bl_3.jpg	f	538	DEEPCOOL MATX MATREXX 30 w/o PSU 1*USB 3.0 Glass front panel Fully bl	gallery	3	\N	web
2658	product_images/mb-lga1200-gigabyte-h410m-h2xddr410xusb6xsataiii_1.jpg	f	612	MB LGA1200 Gigabyte H410M H,2xDDR4,10xUSB,6xSATAIII	gallery	1	\N	web
2659	product_images/mb-lga1200-gigabyte-h410m-h2xddr410xusb6xsataiii_2.jpg	f	612	MB LGA1200 Gigabyte H410M H,2xDDR4,10xUSB,6xSATAIII	gallery	2	\N	web
2660	product_images/mb-lga1200-gigabyte-h410m-h2xddr410xusb6xsataiii_3.jpg	f	612	MB LGA1200 Gigabyte H410M H,2xDDR4,10xUSB,6xSATAIII	gallery	3	\N	web
2661	product_images/besprovodnoy-marshrutizator-wi-fi-cudy-wr1500-ax1500-gigabit-6-dual-ban_0.png	t	740	Беспроводной маршрутизатор Wi-Fi CUDY WR1500 AX1500 Gigabit 6 Dual-Ban	main	0	\N	web
2662	product_images/besprovodnoy-marshrutizator-wi-fi-cudy-wr1500-ax1500-gigabit-6-dual-ban_1.jpg	f	740	Беспроводной маршрутизатор Wi-Fi CUDY WR1500 AX1500 Gigabit 6 Dual-Ban	gallery	1	\N	web
2663	product_images/besprovodnoy-marshrutizator-wi-fi-cudy-wr1500-ax1500-gigabit-6-dual-ban_3.jpg	f	740	Беспроводной маршрутизатор Wi-Fi CUDY WR1500 AX1500 Gigabit 6 Dual-Ban	gallery	3	\N	web
2664	product_images/ddr4-16gb-pc-21333-2666mhz-hikvision_2.jpg	f	616	DDR4 16GB PC-21333 (2666Mhz) HIKVISION	gallery	2	\N	web
2665	product_images/ddr4-16gb-pc-21333-2666mhz-hikvision_3.png	f	616	DDR4 16GB PC-21333 (2666Mhz) HIKVISION	gallery	3	\N	web
2666	product_images/ddr4-16gb-pc-21333-2666mhz-hikvision_7.jpg	f	616	DDR4 16GB PC-21333 (2666Mhz) HIKVISION	gallery	7	\N	web
2667	product_images/ddr3-4096mb-rs3-12800-hikvisionzeppelin_1.jpg	f	615	DDR3 4096MB РС3-12800 Hikvision\\Zeppelin	gallery	1	\N	web
2668	product_images/ddr3-4096mb-rs3-12800-hikvisionzeppelin_2.webp	f	615	DDR3 4096MB РС3-12800 Hikvision\\Zeppelin	gallery	2	\N	web
2669	product_images/ddr3-4096mb-rs3-12800-hikvisionzeppelin_3.jpg	f	615	DDR3 4096MB РС3-12800 Hikvision\\Zeppelin	gallery	3	\N	web
\.


--
-- Data for Name: products_productvariant; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productvariant (id, sku, name, price_override, is_active, sort_order, product_id) FROM stdin;
85	CMK32GX5M2B6000	32GB (2×16) 6000MHz	\N	t	0	420
86	CMK64GX5M2B6000	64GB (2×32) 6000MHz	18500.00	t	1	420
87	MZ-V9P1T0BW	1TB	8700.00	t	2	427
88	MZ-V9P2T0BW	2TB	\N	t	3	427
89	MZ-V9P4T0BW	4TB	27400.00	t	4	427
90	GU605MI-QR107W	Ultra 9 / RTX 4070 / 32GB / 1TB	\N	t	5	467
91	GU605MI-QR064W	Ultra 7 / RTX 4060 / 16GB / 512GB	124000.00	t	6	467
92	MBP16-M4P-24-512	M4 Pro 24GB / 512GB	\N	t	7	470
93	MBP16-M4P-48-1T	M4 Pro 48GB / 1TB	278000.00	t	8	470
94	910-006636	Black	\N	t	9	475
95	910-006637	White	\N	t	0	475
96	910-006638	Pink	\N	t	1	475
\.


--
-- Data for Name: products_productvideo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productvideo (id, title, url, platform, thumbnail, sort_order, created_at, product_id) FROM stdin;
\.


--
-- Data for Name: products_promocampaign; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_promocampaign (id, name, slug, description, is_active, start_date, end_date, banner_image, priority) FROM stdin;
\.


--
-- Data for Name: products_promotionblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_promotionblock (id, title, slug, description, is_active, sort_order, created_at) FROM stdin;
\.


--
-- Data for Name: products_promotionblock_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_promotionblock_categories (id, promotionblock_id, category_id) FROM stdin;
\.


--
-- Data for Name: products_promotionblock_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_promotionblock_products (id, promotionblock_id, product_id) FROM stdin;
\.


--
-- Data for Name: products_review; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_review (id, rating, created_at, customer_id, product_id, text, updated_at, verified_purchase) FROM stdin;
\.


--
-- Data for Name: products_reviewimage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_reviewimage (id, image, sort_order, review_id) FROM stdin;
\.


--
-- Data for Name: products_stock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_stock (id, warehouse, quantity, reserved, product_id, variant_id) FROM stdin;
585	default	10	0	491	\N
586	default	10	0	492	\N
587	default	10	0	493	\N
588	default	10	0	494	\N
589	default	10	0	495	\N
590	default	10	0	496	\N
591	default	10	0	497	\N
592	default	10	0	498	\N
593	default	10	0	499	\N
594	default	10	0	500	\N
595	default	10	0	501	\N
596	default	10	0	502	\N
597	default	10	0	503	\N
598	default	10	0	504	\N
599	default	10	0	505	\N
600	default	10	0	506	\N
601	default	10	0	507	\N
602	default	10	0	508	\N
603	default	10	0	509	\N
604	default	10	0	510	\N
605	default	10	0	511	\N
606	default	10	0	512	\N
477	default	50	0	395	\N
478	default	50	0	396	\N
479	default	50	0	397	\N
480	default	50	0	398	\N
481	default	50	0	399	\N
482	default	50	0	400	\N
483	default	50	0	401	\N
484	default	50	0	402	\N
485	default	50	0	403	\N
486	default	50	0	404	\N
487	default	50	0	405	\N
488	default	50	0	406	\N
489	default	50	0	407	\N
490	default	50	0	408	\N
491	default	50	0	409	\N
492	default	50	0	410	\N
493	default	50	0	411	\N
494	default	50	0	412	\N
495	default	50	0	413	\N
496	default	50	0	414	\N
497	default	50	0	415	\N
498	default	50	0	416	\N
499	default	50	0	417	\N
500	default	50	0	418	\N
501	default	50	0	419	\N
502	default	50	0	420	\N
503	default	30	0	\N	85
504	default	30	0	\N	86
505	default	50	0	421	\N
506	default	50	0	422	\N
507	default	50	0	423	\N
508	default	50	0	424	\N
509	default	50	0	425	\N
510	default	50	0	426	\N
511	default	50	0	427	\N
512	default	30	0	\N	87
513	default	30	0	\N	88
514	default	30	0	\N	89
515	default	50	0	428	\N
516	default	50	0	429	\N
517	default	50	0	430	\N
518	default	50	0	431	\N
519	default	50	0	432	\N
520	default	50	0	433	\N
521	default	50	0	434	\N
522	default	50	0	435	\N
523	default	50	0	436	\N
524	default	50	0	437	\N
525	default	50	0	438	\N
526	default	50	0	439	\N
527	default	50	0	440	\N
528	default	50	0	441	\N
529	default	50	0	442	\N
530	default	50	0	443	\N
531	default	50	0	444	\N
532	default	50	0	445	\N
533	default	50	0	446	\N
534	default	50	0	447	\N
535	default	50	0	448	\N
536	default	50	0	449	\N
537	default	50	0	450	\N
538	default	50	0	451	\N
539	default	50	0	452	\N
540	default	50	0	453	\N
541	default	50	0	454	\N
542	default	50	0	455	\N
543	default	50	0	456	\N
544	default	50	0	457	\N
545	default	50	0	458	\N
546	default	50	0	459	\N
547	default	50	0	460	\N
548	default	50	0	461	\N
549	default	50	0	462	\N
550	default	50	0	463	\N
551	default	50	0	464	\N
552	default	50	0	465	\N
553	default	50	0	466	\N
554	default	50	0	467	\N
555	default	30	0	\N	90
556	default	30	0	\N	91
557	default	50	0	468	\N
558	default	50	0	469	\N
559	default	50	0	470	\N
560	default	30	0	\N	92
561	default	30	0	\N	93
562	default	50	0	471	\N
563	default	50	0	472	\N
564	default	50	0	473	\N
565	default	50	0	474	\N
566	default	50	0	475	\N
567	default	30	0	\N	94
568	default	30	0	\N	95
569	default	30	0	\N	96
570	default	50	0	476	\N
571	default	50	0	477	\N
572	default	50	0	478	\N
573	default	50	0	479	\N
574	default	50	0	480	\N
575	default	50	0	481	\N
576	default	50	0	482	\N
577	default	50	0	483	\N
578	default	50	0	484	\N
579	default	50	0	485	\N
580	default	50	0	486	\N
581	default	50	0	487	\N
582	default	50	0	488	\N
583	default	50	0	489	\N
584	default	50	0	490	\N
607	default	10	0	513	\N
608	default	10	0	514	\N
609	default	10	0	515	\N
610	default	10	0	516	\N
611	default	10	0	517	\N
612	default	10	0	518	\N
613	default	10	0	519	\N
614	default	10	0	520	\N
615	default	10	0	521	\N
616	default	10	0	522	\N
617	default	10	0	523	\N
618	default	10	0	524	\N
619	default	10	0	525	\N
620	default	10	0	526	\N
621	default	10	0	527	\N
622	default	10	0	528	\N
623	default	10	0	529	\N
624	default	10	0	530	\N
625	default	10	0	531	\N
626	default	10	0	532	\N
627	default	10	0	533	\N
628	default	10	0	534	\N
629	default	10	0	535	\N
630	default	10	0	536	\N
631	default	10	0	537	\N
632	default	10	0	538	\N
633	default	10	0	539	\N
634	default	10	0	540	\N
635	default	10	0	541	\N
636	default	10	0	542	\N
637	default	10	0	543	\N
638	default	10	0	544	\N
639	default	10	0	545	\N
640	default	10	0	546	\N
641	default	10	0	547	\N
642	default	10	0	548	\N
643	default	10	0	549	\N
644	default	10	0	550	\N
645	default	10	0	551	\N
646	default	10	0	552	\N
647	default	10	0	553	\N
648	default	10	0	554	\N
649	default	10	0	555	\N
650	default	10	0	556	\N
651	default	10	0	557	\N
652	default	10	0	558	\N
653	default	10	0	559	\N
654	default	10	0	560	\N
655	default	10	0	561	\N
656	default	10	0	562	\N
657	default	10	0	563	\N
658	default	10	0	564	\N
659	default	10	0	565	\N
660	default	10	0	566	\N
661	default	10	0	567	\N
662	default	10	0	568	\N
663	default	10	0	569	\N
664	default	10	0	570	\N
665	default	10	0	571	\N
666	default	10	0	572	\N
667	default	10	0	573	\N
668	default	10	0	574	\N
669	default	10	0	575	\N
670	default	10	0	576	\N
671	default	10	0	577	\N
672	default	10	0	578	\N
673	default	10	0	579	\N
674	default	10	0	580	\N
675	default	10	0	581	\N
676	default	10	0	582	\N
677	default	10	0	583	\N
678	default	10	0	584	\N
679	default	10	0	585	\N
680	default	10	0	586	\N
681	default	10	0	587	\N
682	default	10	0	588	\N
683	default	10	0	589	\N
684	default	10	0	590	\N
685	default	10	0	591	\N
686	default	10	0	592	\N
687	default	10	0	593	\N
688	default	10	0	594	\N
689	default	10	0	595	\N
690	default	10	0	596	\N
691	default	10	0	597	\N
692	default	10	0	598	\N
693	default	10	0	599	\N
694	default	10	0	600	\N
695	default	10	0	601	\N
696	default	10	0	602	\N
697	default	10	0	603	\N
698	default	10	0	604	\N
699	default	10	0	605	\N
700	default	10	0	606	\N
701	default	10	0	607	\N
702	default	10	0	608	\N
703	default	10	0	609	\N
704	default	10	0	610	\N
705	default	10	0	611	\N
706	default	10	0	612	\N
707	default	10	0	613	\N
708	default	10	0	614	\N
709	default	10	0	615	\N
710	default	10	0	616	\N
711	default	10	0	617	\N
712	default	10	0	618	\N
713	default	10	0	619	\N
714	default	10	0	620	\N
715	default	10	0	621	\N
716	default	10	0	622	\N
717	default	10	0	623	\N
718	default	10	0	624	\N
719	default	10	0	625	\N
720	default	10	0	626	\N
721	default	10	0	627	\N
722	default	10	0	628	\N
723	default	10	0	629	\N
724	default	10	0	630	\N
725	default	10	0	631	\N
726	default	10	0	632	\N
727	default	10	0	633	\N
728	default	10	0	634	\N
729	default	10	0	635	\N
730	default	10	0	636	\N
731	default	10	0	637	\N
732	default	10	0	638	\N
733	default	10	0	639	\N
734	default	10	0	640	\N
735	default	10	0	641	\N
736	default	10	0	642	\N
737	default	10	0	643	\N
738	default	10	0	644	\N
739	default	10	0	645	\N
740	default	10	0	646	\N
741	default	10	0	647	\N
742	default	10	0	648	\N
743	default	10	0	649	\N
744	default	10	0	650	\N
745	default	10	0	651	\N
746	default	10	0	652	\N
747	default	10	0	653	\N
748	default	10	0	654	\N
749	default	10	0	655	\N
750	default	10	0	656	\N
751	default	10	0	657	\N
752	default	10	0	658	\N
753	default	10	0	659	\N
754	default	10	0	660	\N
755	default	10	0	661	\N
756	default	10	0	662	\N
757	default	10	0	663	\N
758	default	10	0	664	\N
759	default	10	0	665	\N
760	default	10	0	666	\N
761	default	10	0	667	\N
762	default	10	0	668	\N
763	default	10	0	669	\N
764	default	10	0	670	\N
765	default	10	0	671	\N
766	default	10	0	672	\N
767	default	10	0	673	\N
768	default	10	0	674	\N
769	default	10	0	675	\N
770	default	10	0	676	\N
771	default	10	0	677	\N
772	default	10	0	678	\N
773	default	10	0	679	\N
774	default	10	0	680	\N
775	default	10	0	681	\N
776	default	10	0	682	\N
777	default	10	0	683	\N
778	default	10	0	684	\N
779	default	10	0	685	\N
780	default	10	0	686	\N
781	default	10	0	687	\N
782	default	10	0	688	\N
783	default	10	0	689	\N
784	default	10	0	690	\N
785	default	10	0	691	\N
786	default	10	0	692	\N
787	default	10	0	693	\N
788	default	10	0	694	\N
789	default	10	0	695	\N
790	default	10	0	696	\N
791	default	10	0	697	\N
792	default	10	0	698	\N
793	default	10	0	699	\N
794	default	10	0	700	\N
795	default	10	0	701	\N
796	default	10	0	702	\N
797	default	10	0	703	\N
798	default	10	0	704	\N
799	default	10	0	705	\N
800	default	10	0	706	\N
801	default	10	0	707	\N
802	default	10	0	708	\N
803	default	10	0	709	\N
804	default	10	0	710	\N
805	default	10	0	711	\N
806	default	10	0	712	\N
807	default	10	0	713	\N
808	default	10	0	714	\N
809	default	10	0	715	\N
810	default	10	0	716	\N
811	default	10	0	717	\N
812	default	10	0	718	\N
813	default	10	0	719	\N
814	default	10	0	720	\N
815	default	10	0	721	\N
816	default	10	0	722	\N
817	default	10	0	723	\N
818	default	10	0	724	\N
819	default	10	0	725	\N
820	default	10	0	726	\N
821	default	10	0	727	\N
822	default	10	0	728	\N
823	default	10	0	729	\N
824	default	10	0	730	\N
825	default	10	0	731	\N
826	default	10	0	732	\N
827	default	10	0	733	\N
828	default	10	0	734	\N
829	default	10	0	735	\N
830	default	10	0	736	\N
831	default	10	0	737	\N
832	default	10	0	738	\N
833	default	10	0	739	\N
834	default	10	0	740	\N
835	default	10	0	741	\N
836	default	10	0	742	\N
837	default	10	0	743	\N
838	default	10	0	744	\N
839	default	10	0	745	\N
840	default	10	0	746	\N
841	default	10	0	747	\N
842	default	10	0	748	\N
843	default	10	0	749	\N
844	default	10	0	750	\N
845	default	10	0	751	\N
846	default	10	0	752	\N
847	default	10	0	753	\N
848	default	10	0	754	\N
849	default	10	0	755	\N
850	default	10	0	756	\N
851	default	10	0	757	\N
852	default	10	0	758	\N
853	default	10	0	759	\N
854	default	10	0	760	\N
855	default	10	0	761	\N
856	default	10	0	762	\N
857	default	10	0	763	\N
858	default	10	0	764	\N
859	default	10	0	765	\N
860	default	10	0	766	\N
861	default	10	0	767	\N
862	default	10	0	768	\N
863	default	10	0	769	\N
864	default	10	0	770	\N
865	default	10	0	771	\N
866	default	10	0	772	\N
867	default	10	0	773	\N
868	default	10	0	774	\N
869	default	10	0	775	\N
870	default	10	0	776	\N
871	default	10	0	777	\N
872	default	10	0	778	\N
873	default	10	0	779	\N
874	default	10	0	780	\N
875	default	10	0	781	\N
876	default	10	0	782	\N
877	default	10	0	783	\N
878	default	10	0	784	\N
879	default	10	0	785	\N
880	default	10	0	786	\N
881	default	10	0	787	\N
882	default	10	0	788	\N
883	default	10	0	789	\N
884	default	10	0	790	\N
885	default	10	0	791	\N
886	default	10	0	792	\N
887	default	10	0	793	\N
888	default	10	0	794	\N
889	default	10	0	795	\N
890	default	10	0	796	\N
891	default	10	0	797	\N
892	default	10	0	798	\N
893	default	10	0	799	\N
894	default	10	0	800	\N
895	default	10	0	801	\N
896	default	10	0	802	\N
897	default	10	0	803	\N
898	default	10	0	804	\N
899	default	10	0	805	\N
900	default	10	0	806	\N
901	default	10	0	807	\N
902	default	10	0	808	\N
903	default	10	0	809	\N
904	default	10	0	810	\N
905	default	10	0	811	\N
906	default	10	0	812	\N
907	default	10	0	813	\N
908	default	10	0	814	\N
909	default	10	0	815	\N
910	default	10	0	816	\N
911	default	10	0	817	\N
912	default	10	0	818	\N
913	default	10	0	819	\N
914	default	10	0	820	\N
915	default	10	0	821	\N
916	default	10	0	822	\N
917	default	10	0	823	\N
918	default	10	0	824	\N
919	default	10	0	825	\N
920	default	10	0	826	\N
921	default	10	0	827	\N
922	default	10	0	828	\N
923	default	10	0	829	\N
924	default	10	0	830	\N
925	default	10	0	831	\N
926	default	10	0	832	\N
927	default	10	0	833	\N
928	default	10	0	834	\N
929	default	10	0	835	\N
930	default	10	0	836	\N
931	default	10	0	837	\N
932	default	10	0	838	\N
933	default	10	0	839	\N
934	default	10	0	840	\N
935	default	10	0	841	\N
936	default	10	0	842	\N
937	default	10	0	843	\N
938	default	10	0	844	\N
939	default	10	0	845	\N
940	default	10	0	846	\N
941	default	10	0	847	\N
942	default	10	0	848	\N
943	default	10	0	849	\N
944	default	10	0	850	\N
945	default	10	0	851	\N
946	default	10	0	852	\N
947	default	10	0	853	\N
948	default	10	0	854	\N
949	default	10	0	855	\N
950	default	10	0	856	\N
951	default	10	0	857	\N
952	default	10	0	858	\N
953	default	10	0	859	\N
954	default	10	0	860	\N
955	default	10	0	861	\N
956	default	10	0	862	\N
957	default	10	0	863	\N
958	default	10	0	864	\N
959	default	10	0	865	\N
960	default	10	0	866	\N
961	default	10	0	867	\N
962	default	10	0	868	\N
963	default	10	0	869	\N
964	default	10	0	870	\N
\.


--
-- Data for Name: products_supplier; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_supplier (id, name, slug, contact_person, email, phone, website, is_active, notes) FROM stdin;
\.


--
-- Data for Name: products_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_tag (id, name, slug) FROM stdin;
819	tender	tender
820	water-proof	water-proof
821	fhd	fhd
822	bluetooth	bluetooth
823	gigabit	gigabit
824	wifi	wifi
658	flagship	flagship
659	gaming	gaming
660	raptor-lake	raptor-lake
661	unlocked	unlocked
662	mid-range	mid-range
663	budget	budget
664	entry-level	entry-level
665	3d-v-cache	3d-v-cache
666	zen-4	zen-4
667	productivity	productivity
668	zen-5	zen-5
669	rtx	rtx
670	dlss-3	dlss-3
671	4k	4k
672	1440p	1440p
673	1080p	1080p
674	rdna-3	rdna-3
675	intel-arc	intel-arc
676	xess	xess
677	ddr5	ddr5
678	wi-fi	wi-fi
679	atx	atx
680	am5	am5
681	microatx	microatx
682	ddr4	ddr4
683	am4	am4
684	overclocking	overclocking
685	5600mhz	5600mhz
686	dual-channel	dual-channel
687	6000mhz	6000mhz
688	rgb	rgb
689	6400mhz	6400mhz
690	3200mhz	3200mhz
691	64gb	64gb
692	3600mhz	3600mhz
693	7200mhz	7200mhz
694	nvme	nvme
695	pcie-4	pcie-4
696	high-end	high-end
697	pcie-5	pcie-5
698	next-gen	next-gen
699	sata	sata
700	ssd	ssd
701	reliable	reliable
702	hdd	hdd
703	5400rpm	5400rpm
704	storage	storage
705	nas	nas
706	7200rpm	7200rpm
707	cmr	cmr
708	high-capacity	high-capacity
709	5900rpm	5900rpm
710	modular	modular
711	850w	850w
712	gold	gold
713	quiet	quiet
714	1000w	1000w
715	titanium	titanium
716	750w	750w
717	compact	compact
718	650w	650w
719	non-modular	non-modular
720	low-noise	low-noise
721	atx-3	atx-3
722	semi-modular	semi-modular
723	mid-tower	mid-tower
724	mesh	mesh
725	tempered-glass	tempered-glass
726	wood	wood
727	elegant	elegant
728	airflow	airflow
729	minimalist	minimalist
730	dual-chamber	dual-chamber
731	watercooling	watercooling
732	silent	silent
733	insulated	insulated
734	air-cooling	air-cooling
735	dual-tower	dual-tower
736	140mm	140mm
737	120mm	120mm
738	aio	aio
739	360mm	360mm
740	lcd-display	lcd-display
741	single-tower	single-tower
742	280mm	280mm
743	mirror-display	mirror-display
744	best-value	best-value
745	240hz	240hz
746	qhd	qhd
747	curved	curved
748	va	va
749	165hz	165hz
750	nano-ips	nano-ips
751	hdr	hdr
752	oled	oled
753	office	office
754	ips	ips
755	usb-c	usb-c
756	170hz	170hz
757	kvm	kvm
758	professional	professional
759	color-accurate	color-accurate
760	144hz	144hz
761	hdr600	hdr600
762	rtx-4070	rtx-4070
763	ultra-9	ultra-9
764	rtx-4060	rtx-4060
765	i9	i9
766	i7	i7
767	mini-led	mini-led
768	workstation	workstation
769	m4-pro	m4-pro
770	liquid-retina-xdr	liquid-retina-xdr
771	macos	macos
772	ultrabook	ultrabook
773	m4	m4
774	fanless	fanless
775	lightweight	lightweight
776	premium	premium
777	2-in-1	2-in-1
778	touch-screen	touch-screen
779	business	business
780	thinkpad	thinkpad
781	enterprise	enterprise
782	wireless	wireless
783	60g	60g
784	hero-2	hero-2
785	competitive	competitive
786	esports	esports
787	63g	63g
788	focus-pro-30k	focus-pro-30k
789	ergonomic	ergonomic
790	hero-25k	hero-25k
791	multi-button	multi-button
792	multi-scroll	multi-scroll
793	wired	wired
794	85g	85g
795	no-software	no-software
796	omnipoint-3	omnipoint-3
797	tkl	tkl
798	adjustable-actuation	adjustable-actuation
799	full-size	full-size
800	macro-keys	macro-keys
801	green-switch	green-switch
802	low-profile	low-profile
803	mechanical	mechanical
804	75%	75
805	aluminum	aluminum
806	hot-swap	hot-swap
807	qmk	qmk
808	pbt-keycaps	pbt-keycaps
809	cherry-mx	cherry-mx
810	media-controls	media-controls
811	120h-battery	120h-battery
812	closed-back	closed-back
813	anc	anc
814	hi-fi	hi-fi
815	hot-swap-battery	hot-swap-battery
816	70h-battery	70h-battery
817	50h-battery	50h-battery
818	graphene-driver	graphene-driver
\.


--
-- Data for Name: products_warranty; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_warranty (id, title, duration_value, duration_unit, description, document, is_active, product_id) FROM stdin;
\.


--
-- Data for Name: services_serviceitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.services_serviceitem (id, name, price, category, is_active, sort_order) FROM stdin;
2	Заправка картриджа (1010/1005)	250.00	maintenance	t	0
3	Заправка картриджа (132)	300.00	repair	t	0
4	Переустановка Windows	1000.00	repair	t	0
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 184, true);


--
-- Name: customers_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_address_id_seq', 1, false);


--
-- Name: customers_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_cart_id_seq', 1, false);


--
-- Name: customers_changelog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_changelog_id_seq', 1, false);


--
-- Name: customers_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_coupon_id_seq', 1, false);


--
-- Name: customers_couponusage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_couponusage_id_seq', 1, false);


--
-- Name: customers_customer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_customer_groups_id_seq', 1, false);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 5, true);


--
-- Name: customers_customer_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_customer_user_permissions_id_seq', 1, false);


--
-- Name: customers_customerloyalty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_customerloyalty_id_seq', 1, false);


--
-- Name: customers_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_delivery_id_seq', 1, false);


--
-- Name: customers_loyaltyprogram_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_loyaltyprogram_id_seq', 1, false);


--
-- Name: customers_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_order_id_seq', 15, true);


--
-- Name: customers_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_orderitem_id_seq', 16, true);


--
-- Name: customers_orderstatushistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_orderstatushistory_id_seq', 15, true);


--
-- Name: customers_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_payment_id_seq', 1, false);


--
-- Name: customers_viewedproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_viewedproduct_id_seq', 1, false);


--
-- Name: customers_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_wishlist_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 29, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 45, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 42, true);


--
-- Name: notifications_notificationlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_notificationlog_id_seq', 1, false);


--
-- Name: notifications_notificationsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_notificationsettings_id_seq', 1, true);


--
-- Name: products_adminsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_adminsection_id_seq', 22, true);


--
-- Name: products_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_attribute_id_seq', 306, true);


--
-- Name: products_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_banner_id_seq', 1, false);


--
-- Name: products_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_blogpost_id_seq', 1, false);


--
-- Name: products_blogpost_related_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_blogpost_related_products_id_seq', 1, false);


--
-- Name: products_blogpost_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_blogpost_tags_id_seq', 1, false);


--
-- Name: products_category_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_category_attributes_id_seq', 1, false);


--
-- Name: products_category_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_category_brands_id_seq', 1, false);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_category_id_seq', 243, true);


--
-- Name: products_certificate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_certificate_id_seq', 1, false);


--
-- Name: products_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_discount_id_seq', 1, false);


--
-- Name: products_pricehistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_pricehistory_id_seq', 1, false);


--
-- Name: products_product_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_product_brands_id_seq', 800, true);


--
-- Name: products_product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_product_categories_id_seq', 870, true);


--
-- Name: products_product_feature_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_product_feature_tags_id_seq', 2048, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_product_id_seq', 870, true);


--
-- Name: products_productattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productattribute_id_seq', 1951, true);


--
-- Name: products_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productimage_id_seq', 2669, true);


--
-- Name: products_productvariant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productvariant_id_seq', 96, true);


--
-- Name: products_productvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productvideo_id_seq', 1, false);


--
-- Name: products_promocampaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_promocampaign_id_seq', 1, false);


--
-- Name: products_promotionblock_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_promotionblock_categories_id_seq', 1, false);


--
-- Name: products_promotionblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_promotionblock_id_seq', 1, false);


--
-- Name: products_promotionblock_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_promotionblock_products_id_seq', 1, false);


--
-- Name: products_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_review_id_seq', 1, false);


--
-- Name: products_reviewimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_reviewimage_id_seq', 1, false);


--
-- Name: products_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_stock_id_seq', 964, true);


--
-- Name: products_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_supplier_id_seq', 1, false);


--
-- Name: products_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_tag_id_seq', 406, true);


--
-- Name: products_tag_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_tag_id_seq1', 824, true);


--
-- Name: products_warranty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_warranty_id_seq', 1, false);


--
-- Name: services_serviceitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_serviceitem_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: customers_address customers_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_address
    ADD CONSTRAINT customers_address_pkey PRIMARY KEY (id);


--
-- Name: customers_cart customers_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_cart
    ADD CONSTRAINT customers_cart_pkey PRIMARY KEY (id);


--
-- Name: customers_changelog customers_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_changelog
    ADD CONSTRAINT customers_changelog_pkey PRIMARY KEY (id);


--
-- Name: customers_coupon customers_coupon_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_coupon
    ADD CONSTRAINT customers_coupon_code_key UNIQUE (code);


--
-- Name: customers_coupon customers_coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_coupon
    ADD CONSTRAINT customers_coupon_pkey PRIMARY KEY (id);


--
-- Name: customers_couponusage customers_couponusage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_couponusage
    ADD CONSTRAINT customers_couponusage_pkey PRIMARY KEY (id);


--
-- Name: customers_customer customers_customer_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer
    ADD CONSTRAINT customers_customer_email_key UNIQUE (email);


--
-- Name: customers_customer_groups customers_customer_groups_customer_id_group_id_83eb0e0e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_groups_customer_id_group_id_83eb0e0e_uniq UNIQUE (customer_id, group_id);


--
-- Name: customers_customer_groups customers_customer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_groups_pkey PRIMARY KEY (id);


--
-- Name: customers_customer customers_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer
    ADD CONSTRAINT customers_customer_pkey PRIMARY KEY (id);


--
-- Name: customers_customer_user_permissions customers_customer_user__customer_id_permission_i_cd47699c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_user__customer_id_permission_i_cd47699c_uniq UNIQUE (customer_id, permission_id);


--
-- Name: customers_customer_user_permissions customers_customer_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: customers_customerloyalty customers_customerloyalty_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customerloyalty
    ADD CONSTRAINT customers_customerloyalty_customer_id_key UNIQUE (customer_id);


--
-- Name: customers_customerloyalty customers_customerloyalty_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customerloyalty
    ADD CONSTRAINT customers_customerloyalty_pkey PRIMARY KEY (id);


--
-- Name: customers_delivery customers_delivery_order_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_delivery
    ADD CONSTRAINT customers_delivery_order_id_key UNIQUE (order_id);


--
-- Name: customers_delivery customers_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_delivery
    ADD CONSTRAINT customers_delivery_pkey PRIMARY KEY (id);


--
-- Name: customers_loyaltyprogram customers_loyaltyprogram_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_loyaltyprogram
    ADD CONSTRAINT customers_loyaltyprogram_pkey PRIMARY KEY (id);


--
-- Name: customers_loyaltyprogram customers_loyaltyprogram_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_loyaltyprogram
    ADD CONSTRAINT customers_loyaltyprogram_slug_key UNIQUE (slug);


--
-- Name: customers_order customers_order_order_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_order
    ADD CONSTRAINT customers_order_order_number_key UNIQUE (order_number);


--
-- Name: customers_order customers_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_order
    ADD CONSTRAINT customers_order_pkey PRIMARY KEY (id);


--
-- Name: customers_orderitem customers_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderitem
    ADD CONSTRAINT customers_orderitem_pkey PRIMARY KEY (id);


--
-- Name: customers_orderstatushistory customers_orderstatushistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderstatushistory
    ADD CONSTRAINT customers_orderstatushistory_pkey PRIMARY KEY (id);


--
-- Name: customers_payment customers_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_payment
    ADD CONSTRAINT customers_payment_pkey PRIMARY KEY (id);


--
-- Name: customers_viewedproduct customers_viewedproduct_customer_id_product_id_01ba8d44_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_viewedproduct
    ADD CONSTRAINT customers_viewedproduct_customer_id_product_id_01ba8d44_uniq UNIQUE (customer_id, product_id);


--
-- Name: customers_viewedproduct customers_viewedproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_viewedproduct
    ADD CONSTRAINT customers_viewedproduct_pkey PRIMARY KEY (id);


--
-- Name: customers_wishlist customers_wishlist_customer_id_product_id_c7c0b3de_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_wishlist
    ADD CONSTRAINT customers_wishlist_customer_id_product_id_c7c0b3de_uniq UNIQUE (customer_id, product_id);


--
-- Name: customers_wishlist customers_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_wishlist
    ADD CONSTRAINT customers_wishlist_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: notifications_notificationlog notifications_notificationlog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications_notificationlog
    ADD CONSTRAINT notifications_notificationlog_pkey PRIMARY KEY (id);


--
-- Name: notifications_notificationsettings notifications_notificationsettings_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications_notificationsettings
    ADD CONSTRAINT notifications_notificationsettings_name_key UNIQUE (name);


--
-- Name: notifications_notificationsettings notifications_notificationsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications_notificationsettings
    ADD CONSTRAINT notifications_notificationsettings_pkey PRIMARY KEY (id);


--
-- Name: products_adminsection products_adminsection_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_adminsection
    ADD CONSTRAINT products_adminsection_key_key UNIQUE (key);


--
-- Name: products_adminsection products_adminsection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_adminsection
    ADD CONSTRAINT products_adminsection_pkey PRIMARY KEY (id);


--
-- Name: products_attribute products_attribute_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_attribute
    ADD CONSTRAINT products_attribute_name_key UNIQUE (name);


--
-- Name: products_attribute products_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_attribute
    ADD CONSTRAINT products_attribute_pkey PRIMARY KEY (id);


--
-- Name: products_attribute products_attribute_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_attribute
    ADD CONSTRAINT products_attribute_slug_key UNIQUE (slug);


--
-- Name: products_banner products_banner_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_banner
    ADD CONSTRAINT products_banner_pkey PRIMARY KEY (id);


--
-- Name: products_blogpost products_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost
    ADD CONSTRAINT products_blogpost_pkey PRIMARY KEY (id);


--
-- Name: products_blogpost_related_products products_blogpost_relate_blogpost_id_product_id_db18a161_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_related_products
    ADD CONSTRAINT products_blogpost_relate_blogpost_id_product_id_db18a161_uniq UNIQUE (blogpost_id, product_id);


--
-- Name: products_blogpost_related_products products_blogpost_related_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_related_products
    ADD CONSTRAINT products_blogpost_related_products_pkey PRIMARY KEY (id);


--
-- Name: products_blogpost products_blogpost_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost
    ADD CONSTRAINT products_blogpost_slug_key UNIQUE (slug);


--
-- Name: products_blogpost_tags products_blogpost_tags_blogpost_id_tag_id_16be3b26_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_tags
    ADD CONSTRAINT products_blogpost_tags_blogpost_id_tag_id_16be3b26_uniq UNIQUE (blogpost_id, tag_id);


--
-- Name: products_blogpost_tags products_blogpost_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_tags
    ADD CONSTRAINT products_blogpost_tags_pkey PRIMARY KEY (id);


--
-- Name: products_category_attributes products_category_attrib_category_id_attribute_id_be9aa488_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_attributes
    ADD CONSTRAINT products_category_attrib_category_id_attribute_id_be9aa488_uniq UNIQUE (category_id, attribute_id);


--
-- Name: products_category_attributes products_category_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_attributes
    ADD CONSTRAINT products_category_attributes_pkey PRIMARY KEY (id);


--
-- Name: products_category_brands products_category_brands_category_id_brand_id_cb11283c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_brands
    ADD CONSTRAINT products_category_brands_category_id_brand_id_cb11283c_uniq UNIQUE (category_id, brand_id);


--
-- Name: products_category_brands products_category_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_brands
    ADD CONSTRAINT products_category_brands_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_slug_key UNIQUE (slug);


--
-- Name: products_certificate products_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_certificate
    ADD CONSTRAINT products_certificate_pkey PRIMARY KEY (id);


--
-- Name: products_discount products_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_pkey PRIMARY KEY (id);


--
-- Name: products_pricehistory products_pricehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_pricehistory
    ADD CONSTRAINT products_pricehistory_pkey PRIMARY KEY (id);


--
-- Name: products_product_brands products_product_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_brands
    ADD CONSTRAINT products_product_brands_pkey PRIMARY KEY (id);


--
-- Name: products_product_brands products_product_brands_product_id_brand_id_3fa625df_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_brands
    ADD CONSTRAINT products_product_brands_product_id_brand_id_3fa625df_uniq UNIQUE (product_id, brand_id);


--
-- Name: products_product_categories products_product_categor_product_id_category_id_a1f87bda_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_categories
    ADD CONSTRAINT products_product_categor_product_id_category_id_a1f87bda_uniq UNIQUE (product_id, category_id);


--
-- Name: products_product_categories products_product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_categories
    ADD CONSTRAINT products_product_categories_pkey PRIMARY KEY (id);


--
-- Name: products_product_feature_tags products_product_feature_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_feature_tags
    ADD CONSTRAINT products_product_feature_tags_pkey PRIMARY KEY (id);


--
-- Name: products_product_feature_tags products_product_feature_tags_product_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_feature_tags
    ADD CONSTRAINT products_product_feature_tags_product_id_tag_id_key UNIQUE (product_id, tag_id);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_product products_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_slug_key UNIQUE (slug);


--
-- Name: products_productattribute products_productattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT products_productattribute_pkey PRIMARY KEY (id);


--
-- Name: products_productimage products_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimage_pkey PRIMARY KEY (id);


--
-- Name: products_productvariant products_productvariant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvariant
    ADD CONSTRAINT products_productvariant_pkey PRIMARY KEY (id);


--
-- Name: products_productvariant products_productvariant_sku_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvariant
    ADD CONSTRAINT products_productvariant_sku_key UNIQUE (sku);


--
-- Name: products_productvideo products_productvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvideo
    ADD CONSTRAINT products_productvideo_pkey PRIMARY KEY (id);


--
-- Name: products_promocampaign products_promocampaign_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promocampaign
    ADD CONSTRAINT products_promocampaign_pkey PRIMARY KEY (id);


--
-- Name: products_promocampaign products_promocampaign_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promocampaign
    ADD CONSTRAINT products_promocampaign_slug_key UNIQUE (slug);


--
-- Name: products_promotionblock_categories products_promotionblock__promotionblock_id_catego_ece4c1df_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_categories
    ADD CONSTRAINT products_promotionblock__promotionblock_id_catego_ece4c1df_uniq UNIQUE (promotionblock_id, category_id);


--
-- Name: products_promotionblock_products products_promotionblock__promotionblock_id_produc_0dc90576_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_products
    ADD CONSTRAINT products_promotionblock__promotionblock_id_produc_0dc90576_uniq UNIQUE (promotionblock_id, product_id);


--
-- Name: products_promotionblock_categories products_promotionblock_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_categories
    ADD CONSTRAINT products_promotionblock_categories_pkey PRIMARY KEY (id);


--
-- Name: products_promotionblock products_promotionblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock
    ADD CONSTRAINT products_promotionblock_pkey PRIMARY KEY (id);


--
-- Name: products_promotionblock_products products_promotionblock_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_products
    ADD CONSTRAINT products_promotionblock_products_pkey PRIMARY KEY (id);


--
-- Name: products_promotionblock products_promotionblock_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock
    ADD CONSTRAINT products_promotionblock_slug_key UNIQUE (slug);


--
-- Name: products_review products_review_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_pkey PRIMARY KEY (id);


--
-- Name: products_review products_review_product_id_customer_id_aea431ea_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_product_id_customer_id_aea431ea_uniq UNIQUE (product_id, customer_id);


--
-- Name: products_reviewimage products_reviewimage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_reviewimage
    ADD CONSTRAINT products_reviewimage_pkey PRIMARY KEY (id);


--
-- Name: products_stock products_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT products_stock_pkey PRIMARY KEY (id);


--
-- Name: products_supplier products_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_supplier
    ADD CONSTRAINT products_supplier_pkey PRIMARY KEY (id);


--
-- Name: products_supplier products_supplier_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_supplier
    ADD CONSTRAINT products_supplier_slug_key UNIQUE (slug);


--
-- Name: products_brand products_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_brand
    ADD CONSTRAINT products_tag_name_key UNIQUE (name);


--
-- Name: products_tag products_tag_name_key1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_tag
    ADD CONSTRAINT products_tag_name_key1 UNIQUE (name);


--
-- Name: products_brand products_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_brand
    ADD CONSTRAINT products_tag_pkey PRIMARY KEY (id);


--
-- Name: products_tag products_tag_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_tag
    ADD CONSTRAINT products_tag_pkey1 PRIMARY KEY (id);


--
-- Name: products_brand products_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_brand
    ADD CONSTRAINT products_tag_slug_key UNIQUE (slug);


--
-- Name: products_tag products_tag_slug_key1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_tag
    ADD CONSTRAINT products_tag_slug_key1 UNIQUE (slug);


--
-- Name: products_warranty products_warranty_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_warranty
    ADD CONSTRAINT products_warranty_pkey PRIMARY KEY (id);


--
-- Name: services_serviceitem services_serviceitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_serviceitem
    ADD CONSTRAINT services_serviceitem_pkey PRIMARY KEY (id);


--
-- Name: products_productattribute unique_variant_attribute; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT unique_variant_attribute UNIQUE (variant_id, attribute_id);


--
-- Name: products_stock unique_variant_warehouse; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT unique_variant_warehouse UNIQUE (variant_id, warehouse);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: customers_address_customer_id_f042422e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_address_customer_id_f042422e ON public.customers_address USING btree (customer_id);


--
-- Name: customers_c_created_3f28da_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_c_created_3f28da_idx ON public.customers_changelog USING btree (created_at DESC);


--
-- Name: customers_c_model_n_b180dc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_c_model_n_b180dc_idx ON public.customers_changelog USING btree (model_name, object_id);


--
-- Name: customers_cart_customer_id_97ed88ec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_customer_id_97ed88ec ON public.customers_cart USING btree (customer_id);


--
-- Name: customers_cart_product_id_f9590726; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_product_id_f9590726 ON public.customers_cart USING btree (product_id);


--
-- Name: customers_cart_session_key_fe9c4fe9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_session_key_fe9c4fe9 ON public.customers_cart USING btree (session_key);


--
-- Name: customers_cart_session_key_fe9c4fe9_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_session_key_fe9c4fe9_like ON public.customers_cart USING btree (session_key varchar_pattern_ops);


--
-- Name: customers_cart_variant_id_6b82f2f7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_variant_id_6b82f2f7 ON public.customers_cart USING btree (variant_id);


--
-- Name: customers_changelog_user_id_cc89dfbf; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_changelog_user_id_cc89dfbf ON public.customers_changelog USING btree (user_id);


--
-- Name: customers_coupon_code_6015aa33_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_coupon_code_6015aa33_like ON public.customers_coupon USING btree (code varchar_pattern_ops);


--
-- Name: customers_couponusage_coupon_id_3c40cde6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_couponusage_coupon_id_3c40cde6 ON public.customers_couponusage USING btree (coupon_id);


--
-- Name: customers_couponusage_customer_id_cf9982e0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_couponusage_customer_id_cf9982e0 ON public.customers_couponusage USING btree (customer_id);


--
-- Name: customers_couponusage_order_id_aa07dd51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_couponusage_order_id_aa07dd51 ON public.customers_couponusage USING btree (order_id);


--
-- Name: customers_customer_email_300e404b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_email_300e404b_like ON public.customers_customer USING btree (email varchar_pattern_ops);


--
-- Name: customers_customer_groups_customer_id_39e075d7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_groups_customer_id_39e075d7 ON public.customers_customer_groups USING btree (customer_id);


--
-- Name: customers_customer_groups_group_id_f079b2be; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_groups_group_id_f079b2be ON public.customers_customer_groups USING btree (group_id);


--
-- Name: customers_customer_user_permissions_customer_id_39cf3cb6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_user_permissions_customer_id_39cf3cb6 ON public.customers_customer_user_permissions USING btree (customer_id);


--
-- Name: customers_customer_user_permissions_permission_id_36492949; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_user_permissions_permission_id_36492949 ON public.customers_customer_user_permissions USING btree (permission_id);


--
-- Name: customers_customerloyalty_level_id_fb5f45fb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customerloyalty_level_id_fb5f45fb ON public.customers_customerloyalty USING btree (level_id);


--
-- Name: customers_delivery_address_id_f3e68cce; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_delivery_address_id_f3e68cce ON public.customers_delivery USING btree (address_id);


--
-- Name: customers_loyaltyprogram_slug_dc3ba2d5_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_loyaltyprogram_slug_dc3ba2d5_like ON public.customers_loyaltyprogram USING btree (slug varchar_pattern_ops);


--
-- Name: customers_order_customer_id_032dd871; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_order_customer_id_032dd871 ON public.customers_order USING btree (customer_id);


--
-- Name: customers_order_order_number_b3d7f651_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_order_order_number_b3d7f651_like ON public.customers_order USING btree (order_number varchar_pattern_ops);


--
-- Name: customers_orderitem_order_id_0c19357b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderitem_order_id_0c19357b ON public.customers_orderitem USING btree (order_id);


--
-- Name: customers_orderitem_product_id_9189abb4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderitem_product_id_9189abb4 ON public.customers_orderitem USING btree (product_id);


--
-- Name: customers_orderitem_variant_id_d4b3378b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderitem_variant_id_d4b3378b ON public.customers_orderitem USING btree (variant_id);


--
-- Name: customers_orderstatushistory_changed_by_id_71ca4256; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderstatushistory_changed_by_id_71ca4256 ON public.customers_orderstatushistory USING btree (changed_by_id);


--
-- Name: customers_orderstatushistory_order_id_34a07fdc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderstatushistory_order_id_34a07fdc ON public.customers_orderstatushistory USING btree (order_id);


--
-- Name: customers_payment_order_id_7af7afda; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_payment_order_id_7af7afda ON public.customers_payment USING btree (order_id);


--
-- Name: customers_viewedproduct_customer_id_8fa665f2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_viewedproduct_customer_id_8fa665f2 ON public.customers_viewedproduct USING btree (customer_id);


--
-- Name: customers_viewedproduct_product_id_f902dc9b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_viewedproduct_product_id_f902dc9b ON public.customers_viewedproduct USING btree (product_id);


--
-- Name: customers_wishlist_customer_id_8554e4f5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_wishlist_customer_id_8554e4f5 ON public.customers_wishlist USING btree (customer_id);


--
-- Name: customers_wishlist_product_id_6788646b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_wishlist_product_id_6788646b ON public.customers_wishlist USING btree (product_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: notifications_notificationlog_order_id_275e19e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_notificationlog_order_id_275e19e6 ON public.notifications_notificationlog USING btree (order_id);


--
-- Name: notifications_notificationsettings_name_de22d795_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_notificationsettings_name_de22d795_like ON public.notifications_notificationsettings USING btree (name varchar_pattern_ops);


--
-- Name: products_adminsection_key_7d3f08c7_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_adminsection_key_7d3f08c7_like ON public.products_adminsection USING btree (key varchar_pattern_ops);


--
-- Name: products_at_type_f4fcf3_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_at_type_f4fcf3_idx ON public.products_attribute USING btree (type, slug);


--
-- Name: products_attribute_name_e203e819_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_attribute_name_e203e819_like ON public.products_attribute USING btree (name varchar_pattern_ops);


--
-- Name: products_attribute_slug_3436e67a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_attribute_slug_3436e67a_like ON public.products_attribute USING btree (slug varchar_pattern_ops);


--
-- Name: products_banner_category_id_6ffcde53; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_banner_category_id_6ffcde53 ON public.products_banner USING btree (category_id);


--
-- Name: products_bl_status_aab172_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_bl_status_aab172_idx ON public.products_blogpost USING btree (status, published_at DESC);


--
-- Name: products_blogpost_author_id_567d983f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_author_id_567d983f ON public.products_blogpost USING btree (author_id);


--
-- Name: products_blogpost_related_products_blogpost_id_8b6639e4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_related_products_blogpost_id_8b6639e4 ON public.products_blogpost_related_products USING btree (blogpost_id);


--
-- Name: products_blogpost_related_products_product_id_de7a3b9d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_related_products_product_id_de7a3b9d ON public.products_blogpost_related_products USING btree (product_id);


--
-- Name: products_blogpost_slug_59c8d621_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_slug_59c8d621_like ON public.products_blogpost USING btree (slug varchar_pattern_ops);


--
-- Name: products_blogpost_tags_blogpost_id_413833f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_tags_blogpost_id_413833f9 ON public.products_blogpost_tags USING btree (blogpost_id);


--
-- Name: products_blogpost_tags_tag_id_195753d7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_tags_tag_id_195753d7 ON public.products_blogpost_tags USING btree (tag_id);


--
-- Name: products_category_attributes_attribute_id_4cd0be2e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_attributes_attribute_id_4cd0be2e ON public.products_category_attributes USING btree (attribute_id);


--
-- Name: products_category_attributes_category_id_bf20cdc7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_attributes_category_id_bf20cdc7 ON public.products_category_attributes USING btree (category_id);


--
-- Name: products_category_brands_brand_id_fc34923b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_brands_brand_id_fc34923b ON public.products_category_brands USING btree (brand_id);


--
-- Name: products_category_brands_category_id_f3697e5d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_brands_category_id_f3697e5d ON public.products_category_brands USING btree (category_id);


--
-- Name: products_category_parent_id_3388f6c9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_parent_id_3388f6c9 ON public.products_category USING btree (parent_id);


--
-- Name: products_category_slug_c558efae_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_slug_c558efae_like ON public.products_category USING btree (slug varchar_pattern_ops);


--
-- Name: products_certificate_product_id_7564eb6b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_certificate_product_id_7564eb6b ON public.products_certificate USING btree (product_id);


--
-- Name: products_di_categor_a1a6ee_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_di_categor_a1a6ee_idx ON public.products_discount USING btree (category_id, is_active);


--
-- Name: products_di_product_33ad43_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_di_product_33ad43_idx ON public.products_discount USING btree (product_id, is_active);


--
-- Name: products_di_variant_7129c4_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_di_variant_7129c4_idx ON public.products_discount USING btree (variant_id, is_active);


--
-- Name: products_discount_category_id_7f843ced; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_discount_category_id_7f843ced ON public.products_discount USING btree (category_id);


--
-- Name: products_discount_product_id_c39a20cb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_discount_product_id_c39a20cb ON public.products_discount USING btree (product_id);


--
-- Name: products_discount_promo_campaign_id_22319ff1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_discount_promo_campaign_id_22319ff1 ON public.products_discount USING btree (promo_campaign_id);


--
-- Name: products_discount_variant_id_0ab210d0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_discount_variant_id_0ab210d0 ON public.products_discount USING btree (variant_id);


--
-- Name: products_pr_attribu_4705f4_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_attribu_4705f4_idx ON public.products_productattribute USING btree (attribute_id, value_enum);


--
-- Name: products_pr_attribu_87c5a9_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_attribu_87c5a9_idx ON public.products_productattribute USING btree (attribute_id, value_int);


--
-- Name: products_pr_product_66459e_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_product_66459e_idx ON public.products_productvariant USING btree (product_id, is_active);


--
-- Name: products_pr_product_94a04a_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_product_94a04a_idx ON public.products_productattribute USING btree (product_id, attribute_id);


--
-- Name: products_pr_product_f0e7be_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_product_f0e7be_idx ON public.products_pricehistory USING btree (product_id, changed_at DESC);


--
-- Name: products_pr_variant_989f38_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_variant_989f38_idx ON public.products_productattribute USING btree (variant_id, attribute_id);


--
-- Name: products_pr_variant_9e2fe6_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_variant_9e2fe6_idx ON public.products_pricehistory USING btree (variant_id, changed_at DESC);


--
-- Name: products_pricehistory_product_id_1fc0e3fe; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pricehistory_product_id_1fc0e3fe ON public.products_pricehistory USING btree (product_id);


--
-- Name: products_pricehistory_variant_id_7a8d8d2e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pricehistory_variant_id_7a8d8d2e ON public.products_pricehistory USING btree (variant_id);


--
-- Name: products_product_brands_brand_id_283aac29; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_brands_brand_id_283aac29 ON public.products_product_brands USING btree (brand_id);


--
-- Name: products_product_brands_product_id_e551c83f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_brands_product_id_e551c83f ON public.products_product_brands USING btree (product_id);


--
-- Name: products_product_categories_category_id_27982bed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_categories_category_id_27982bed ON public.products_product_categories USING btree (category_id);


--
-- Name: products_product_categories_product_id_50ef8156; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_categories_product_id_50ef8156 ON public.products_product_categories USING btree (product_id);


--
-- Name: products_product_feature_tags_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_feature_tags_product_id ON public.products_product_feature_tags USING btree (product_id);


--
-- Name: products_product_feature_tags_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_feature_tags_tag_id ON public.products_product_feature_tags USING btree (tag_id);


--
-- Name: products_product_slug_70d3148d_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_slug_70d3148d_like ON public.products_product USING btree (slug varchar_pattern_ops);


--
-- Name: products_productattribute_attribute_id_de00002b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productattribute_attribute_id_de00002b ON public.products_productattribute USING btree (attribute_id);


--
-- Name: products_productattribute_product_id_b9a86828; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productattribute_product_id_b9a86828 ON public.products_productattribute USING btree (product_id);


--
-- Name: products_productattribute_variant_id_e4b8d9e4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productattribute_variant_id_e4b8d9e4 ON public.products_productattribute USING btree (variant_id);


--
-- Name: products_productimage_product_id_e747596a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productimage_product_id_e747596a ON public.products_productimage USING btree (product_id);


--
-- Name: products_productimage_variant_id_bf70ade8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productimage_variant_id_bf70ade8 ON public.products_productimage USING btree (variant_id);


--
-- Name: products_productvariant_product_id_d9c22902; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productvariant_product_id_d9c22902 ON public.products_productvariant USING btree (product_id);


--
-- Name: products_productvariant_sku_1b692018_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productvariant_sku_1b692018_like ON public.products_productvariant USING btree (sku varchar_pattern_ops);


--
-- Name: products_productvideo_product_id_872fe729; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productvideo_product_id_872fe729 ON public.products_productvideo USING btree (product_id);


--
-- Name: products_promocampaign_slug_68a6d529_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promocampaign_slug_68a6d529_like ON public.products_promocampaign USING btree (slug varchar_pattern_ops);


--
-- Name: products_promotionblock_categories_category_id_80df819f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_categories_category_id_80df819f ON public.products_promotionblock_categories USING btree (category_id);


--
-- Name: products_promotionblock_categories_promotionblock_id_dadbd43e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_categories_promotionblock_id_dadbd43e ON public.products_promotionblock_categories USING btree (promotionblock_id);


--
-- Name: products_promotionblock_products_product_id_ea5f3c1a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_products_product_id_ea5f3c1a ON public.products_promotionblock_products USING btree (product_id);


--
-- Name: products_promotionblock_products_promotionblock_id_e5dfe04c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_products_promotionblock_id_e5dfe04c ON public.products_promotionblock_products USING btree (promotionblock_id);


--
-- Name: products_promotionblock_slug_003da5f5_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_slug_003da5f5_like ON public.products_promotionblock USING btree (slug varchar_pattern_ops);


--
-- Name: products_review_customer_id_54220657; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_review_customer_id_54220657 ON public.products_review USING btree (customer_id);


--
-- Name: products_review_product_id_d933ffa7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_review_product_id_d933ffa7 ON public.products_review USING btree (product_id);


--
-- Name: products_reviewimage_review_id_c90b3860; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_reviewimage_review_id_c90b3860 ON public.products_reviewimage USING btree (review_id);


--
-- Name: products_st_product_282fcc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_st_product_282fcc_idx ON public.products_stock USING btree (product_id, warehouse);


--
-- Name: products_st_variant_10937e_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_st_variant_10937e_idx ON public.products_stock USING btree (variant_id, warehouse);


--
-- Name: products_stock_product_id_170f916b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_stock_product_id_170f916b ON public.products_stock USING btree (product_id);


--
-- Name: products_stock_variant_id_dc51ed5d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_stock_variant_id_dc51ed5d ON public.products_stock USING btree (variant_id);


--
-- Name: products_supplier_slug_1073577c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_supplier_slug_1073577c_like ON public.products_supplier USING btree (slug varchar_pattern_ops);


--
-- Name: products_tag_name_df2d816e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_tag_name_df2d816e_like ON public.products_brand USING btree (name varchar_pattern_ops);


--
-- Name: products_tag_slug_5def095b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_tag_slug_5def095b_like ON public.products_brand USING btree (slug varchar_pattern_ops);


--
-- Name: products_warranty_product_id_51395474; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_warranty_product_id_51395474 ON public.products_warranty USING btree (product_id);


--
-- Name: unique_customer_cart_item; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_customer_cart_item ON public.customers_cart USING btree (customer_id, product_id, variant_id) WHERE ((session_key)::text = ''::text);


--
-- Name: unique_product_attribute; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_product_attribute ON public.products_productattribute USING btree (product_id, attribute_id) WHERE (variant_id IS NULL);


--
-- Name: unique_product_warehouse; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_product_warehouse ON public.products_stock USING btree (product_id, warehouse) WHERE (variant_id IS NULL);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_address customers_address_customer_id_f042422e_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_address
    ADD CONSTRAINT customers_address_customer_id_f042422e_fk_customers_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_cart customers_cart_customer_id_97ed88ec_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_cart
    ADD CONSTRAINT customers_cart_customer_id_97ed88ec_fk_customers_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_cart customers_cart_product_id_f9590726_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_cart
    ADD CONSTRAINT customers_cart_product_id_f9590726_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_cart customers_cart_variant_id_6b82f2f7_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_cart
    ADD CONSTRAINT customers_cart_variant_id_6b82f2f7_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_changelog customers_changelog_user_id_cc89dfbf_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_changelog
    ADD CONSTRAINT customers_changelog_user_id_cc89dfbf_fk_customers_customer_id FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_couponusage customers_couponusag_customer_id_cf9982e0_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_couponusage
    ADD CONSTRAINT customers_couponusag_customer_id_cf9982e0_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_couponusage customers_couponusage_coupon_id_3c40cde6_fk_customers_coupon_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_couponusage
    ADD CONSTRAINT customers_couponusage_coupon_id_3c40cde6_fk_customers_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.customers_coupon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_couponusage customers_couponusage_order_id_aa07dd51_fk_customers_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_couponusage
    ADD CONSTRAINT customers_couponusage_order_id_aa07dd51_fk_customers_order_id FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_groups customers_customer_g_customer_id_39e075d7_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_g_customer_id_39e075d7_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_groups customers_customer_groups_group_id_f079b2be_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_groups_group_id_f079b2be_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_user_permissions customers_customer_u_customer_id_39cf3cb6_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_u_customer_id_39cf3cb6_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_user_permissions customers_customer_u_permission_id_36492949_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_u_permission_id_36492949_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customerloyalty customers_customerlo_customer_id_539068e4_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customerloyalty
    ADD CONSTRAINT customers_customerlo_customer_id_539068e4_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customerloyalty customers_customerlo_level_id_fb5f45fb_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customerloyalty
    ADD CONSTRAINT customers_customerlo_level_id_fb5f45fb_fk_customers FOREIGN KEY (level_id) REFERENCES public.customers_loyaltyprogram(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_delivery customers_delivery_address_id_f3e68cce_fk_customers_address_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_delivery
    ADD CONSTRAINT customers_delivery_address_id_f3e68cce_fk_customers_address_id FOREIGN KEY (address_id) REFERENCES public.customers_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_delivery customers_delivery_order_id_006f6c75_fk_customers_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_delivery
    ADD CONSTRAINT customers_delivery_order_id_006f6c75_fk_customers_order_id FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_order customers_order_customer_id_032dd871_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_order
    ADD CONSTRAINT customers_order_customer_id_032dd871_fk_customers_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderitem customers_orderitem_order_id_0c19357b_fk_customers_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderitem
    ADD CONSTRAINT customers_orderitem_order_id_0c19357b_fk_customers_order_id FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderitem customers_orderitem_product_id_9189abb4_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderitem
    ADD CONSTRAINT customers_orderitem_product_id_9189abb4_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderitem customers_orderitem_variant_id_d4b3378b_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderitem
    ADD CONSTRAINT customers_orderitem_variant_id_d4b3378b_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderstatushistory customers_orderstatu_changed_by_id_71ca4256_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderstatushistory
    ADD CONSTRAINT customers_orderstatu_changed_by_id_71ca4256_fk_customers FOREIGN KEY (changed_by_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderstatushistory customers_orderstatu_order_id_34a07fdc_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderstatushistory
    ADD CONSTRAINT customers_orderstatu_order_id_34a07fdc_fk_customers FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_payment customers_payment_order_id_7af7afda_fk_customers_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_payment
    ADD CONSTRAINT customers_payment_order_id_7af7afda_fk_customers_order_id FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_viewedproduct customers_viewedprod_customer_id_8fa665f2_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_viewedproduct
    ADD CONSTRAINT customers_viewedprod_customer_id_8fa665f2_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_viewedproduct customers_viewedprod_product_id_f902dc9b_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_viewedproduct
    ADD CONSTRAINT customers_viewedprod_product_id_f902dc9b_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_wishlist customers_wishlist_customer_id_8554e4f5_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_wishlist
    ADD CONSTRAINT customers_wishlist_customer_id_8554e4f5_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_wishlist customers_wishlist_product_id_6788646b_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_wishlist
    ADD CONSTRAINT customers_wishlist_product_id_6788646b_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_customers_customer_id FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notificationlog notifications_notifi_order_id_275e19e6_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications_notificationlog
    ADD CONSTRAINT notifications_notifi_order_id_275e19e6_fk_customers FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_banner products_banner_category_id_6ffcde53_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_banner
    ADD CONSTRAINT products_banner_category_id_6ffcde53_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost products_blogpost_author_id_567d983f_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost
    ADD CONSTRAINT products_blogpost_author_id_567d983f_fk_customers_customer_id FOREIGN KEY (author_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost_related_products products_blogpost_re_blogpost_id_8b6639e4_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_related_products
    ADD CONSTRAINT products_blogpost_re_blogpost_id_8b6639e4_fk_products_ FOREIGN KEY (blogpost_id) REFERENCES public.products_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost_related_products products_blogpost_re_product_id_de7a3b9d_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_related_products
    ADD CONSTRAINT products_blogpost_re_product_id_de7a3b9d_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost_tags products_blogpost_ta_blogpost_id_413833f9_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_tags
    ADD CONSTRAINT products_blogpost_ta_blogpost_id_413833f9_fk_products_ FOREIGN KEY (blogpost_id) REFERENCES public.products_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost_tags products_blogpost_tags_tag_id_195753d7_fk_products_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_tags
    ADD CONSTRAINT products_blogpost_tags_tag_id_195753d7_fk_products_tag_id FOREIGN KEY (tag_id) REFERENCES public.products_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_attributes products_category_at_attribute_id_4cd0be2e_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_attributes
    ADD CONSTRAINT products_category_at_attribute_id_4cd0be2e_fk_products_ FOREIGN KEY (attribute_id) REFERENCES public.products_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_attributes products_category_at_category_id_bf20cdc7_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_attributes
    ADD CONSTRAINT products_category_at_category_id_bf20cdc7_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_brands products_category_br_category_id_f3697e5d_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_brands
    ADD CONSTRAINT products_category_br_category_id_f3697e5d_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_brands products_category_brands_brand_id_fc34923b_fk_products_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_brands
    ADD CONSTRAINT products_category_brands_brand_id_fc34923b_fk_products_brand_id FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category products_category_parent_id_3388f6c9_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_parent_id_3388f6c9_fk_products_category_id FOREIGN KEY (parent_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_certificate products_certificate_product_id_7564eb6b_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_certificate
    ADD CONSTRAINT products_certificate_product_id_7564eb6b_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_discount products_discount_category_id_7f843ced_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_category_id_7f843ced_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_discount products_discount_product_id_c39a20cb_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_product_id_c39a20cb_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_discount products_discount_promo_campaign_id_22319ff1_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_promo_campaign_id_22319ff1_fk_products_ FOREIGN KEY (promo_campaign_id) REFERENCES public.products_promocampaign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_discount products_discount_variant_id_0ab210d0_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_variant_id_0ab210d0_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_pricehistory products_pricehistor_product_id_1fc0e3fe_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_pricehistory
    ADD CONSTRAINT products_pricehistor_product_id_1fc0e3fe_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_pricehistory products_pricehistor_variant_id_7a8d8d2e_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_pricehistory
    ADD CONSTRAINT products_pricehistor_variant_id_7a8d8d2e_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_brands products_product_bra_product_id_e551c83f_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_brands
    ADD CONSTRAINT products_product_bra_product_id_e551c83f_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_brands products_product_brands_brand_id_283aac29_fk_products_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_brands
    ADD CONSTRAINT products_product_brands_brand_id_283aac29_fk_products_brand_id FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_categories products_product_cat_category_id_27982bed_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_categories
    ADD CONSTRAINT products_product_cat_category_id_27982bed_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_categories products_product_cat_product_id_50ef8156_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_categories
    ADD CONSTRAINT products_product_cat_product_id_50ef8156_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_feature_tags products_product_feature_tags_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_feature_tags
    ADD CONSTRAINT products_product_feature_tags_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_feature_tags products_product_feature_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_feature_tags
    ADD CONSTRAINT products_product_feature_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.products_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productattribute products_productattr_attribute_id_de00002b_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT products_productattr_attribute_id_de00002b_fk_products_ FOREIGN KEY (attribute_id) REFERENCES public.products_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productattribute products_productattr_product_id_b9a86828_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT products_productattr_product_id_b9a86828_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productattribute products_productattr_variant_id_e4b8d9e4_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT products_productattr_variant_id_e4b8d9e4_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productimage products_productimag_product_id_e747596a_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimag_product_id_e747596a_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productimage products_productimag_variant_id_bf70ade8_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimag_variant_id_bf70ade8_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productvariant products_productvari_product_id_d9c22902_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvariant
    ADD CONSTRAINT products_productvari_product_id_d9c22902_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productvideo products_productvide_product_id_872fe729_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvideo
    ADD CONSTRAINT products_productvide_product_id_872fe729_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_promotionblock_categories products_promotionbl_category_id_80df819f_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_categories
    ADD CONSTRAINT products_promotionbl_category_id_80df819f_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_promotionblock_products products_promotionbl_product_id_ea5f3c1a_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_products
    ADD CONSTRAINT products_promotionbl_product_id_ea5f3c1a_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_promotionblock_categories products_promotionbl_promotionblock_id_dadbd43e_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_categories
    ADD CONSTRAINT products_promotionbl_promotionblock_id_dadbd43e_fk_products_ FOREIGN KEY (promotionblock_id) REFERENCES public.products_promotionblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_promotionblock_products products_promotionbl_promotionblock_id_e5dfe04c_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_products
    ADD CONSTRAINT products_promotionbl_promotionblock_id_e5dfe04c_fk_products_ FOREIGN KEY (promotionblock_id) REFERENCES public.products_promotionblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_review products_review_customer_id_54220657_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_customer_id_54220657_fk_customers_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_review products_review_product_id_d933ffa7_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_product_id_d933ffa7_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_reviewimage products_reviewimage_review_id_c90b3860_fk_products_review_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_reviewimage
    ADD CONSTRAINT products_reviewimage_review_id_c90b3860_fk_products_review_id FOREIGN KEY (review_id) REFERENCES public.products_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_stock products_stock_product_id_170f916b_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT products_stock_product_id_170f916b_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_stock products_stock_variant_id_dc51ed5d_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT products_stock_variant_id_dc51ed5d_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_warranty products_warranty_product_id_51395474_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_warranty
    ADD CONSTRAINT products_warranty_product_id_51395474_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict z7XKe8RuDcBuCsm2q5EbekbnlTbNMHKlRP6Oq8rwZChii9maBQbMXiwEs4E25cs


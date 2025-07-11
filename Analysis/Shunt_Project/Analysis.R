# Load required libraries
library(tidyverse)    # for data wrangling and plotting
library(readxl)       # for reading Excel files
library(Seurat)       # for NoLegend()
library(cowplot)      # for combining plots

# =============================================================================
# 📁 Data Loading
# =============================================================================

# Load GFAP and Neun data
df.gfap.neun <- read_excel(
  "/Users/vatsaljariwala/Documents/ Shunt_Project/Datasheet/#1039.xlsx", 
  sheet = "#1039_GFAP_Neun"
) %>% 
  na.omit()

# Load Iba1 and Olig2 data
df.iba.olig <- read_excel(
  "/Users/vatsaljariwala/Documents/ Shunt_Project/Datasheet/#1039.xlsx", 
  sheet = "#1039_Iba1_Olig"
) %>% 
  na.omit()

# =============================================================================
# 📊 GFAP & Neun Cell Counts
# =============================================================================

# Reshape to long format for bar plot
df.gfap.neun_long <- df.gfap.neun %>%
  pivot_longer(cols = c(GFAP, Neun), names_to = "Marker", values_to = "Value")

# Plot raw counts
gfap.neun_count <- ggplot(df.gfap.neun_long, aes(
  x = as.factor(Timepoint), y = Value, 
  fill = as.factor(Timepoint), color = as.factor(Timepoint)
)) +
  geom_bar(stat = "identity", position = position_dodge(0.9)) +
  facet_wrap(~ Marker, scales = "free_y") +
  theme_bw() +
  ylim(0, 100) +
  labs(x = "Timepoints (DIV)", y = "") +
  NoLegend()

# =============================================================================
# 📊 GFAP & Neun Percentages
# =============================================================================

# Reshape percentage data
df.gfap.neun_long_percent <- df.gfap.neun %>%
  pivot_longer(cols = c(per_GFAP, per_Neun), names_to = "Marker", values_to = "Value") %>%
  mutate(Marker = case_when(
    Marker == "per_GFAP" ~ "GFAP",
    Marker == "per_Neun" ~ "Neun"
  ))

# Plot percentages
gfap.neun_percent <- ggplot(df.gfap.neun_long_percent, aes(
  x = as.factor(Timepoint), y = Value,
  fill = as.factor(Timepoint), color = as.factor(Timepoint)
)) +
  geom_bar(stat = "identity", position = position_dodge(0.9)) +
  facet_wrap(~ Marker, scales = "free_y") +
  theme_bw() +
  ylim(0, 100) +
  labs(x = "Timepoints (DIV)", y = "") +
  NoLegend()

# =============================================================================
# 📊 Iba1 & Olig2 Cell Counts
# =============================================================================

# Reshape to long format
df.iba.olig_long <- df.iba.olig %>%
  pivot_longer(cols = c(Iba1, Olig2), names_to = "Marker", values_to = "Value")

# Plot raw counts
iba_olig_count <- ggplot(df.iba.olig_long, aes(
  x = as.factor(Timepoint), y = Value, 
  fill = as.factor(Timepoint), color = as.factor(Timepoint)
)) +
  geom_bar(stat = "identity", position = position_dodge(0.9)) +
  facet_wrap(~ Marker, scales = "free_y") +
  theme_bw() +
  ylim(0, 100) +
  labs(x = "Timepoints (DIV)", y = "Cell Count") +
  NoLegend()

# =============================================================================
# 📊 Iba1 & Olig2 Percentages
# =============================================================================

# Reshape percentage data
df.iba.olig_long_percent <- df.iba.olig %>%
  pivot_longer(cols = c(per_Iba1, per_Olig2), names_to = "Marker", values_to = "Value") %>%
  mutate(Marker = case_when(
    Marker == "per_Iba1" ~ "Iba1",
    Marker == "per_Olig2" ~ "Olig2"
  ))

# Plot percentages
iba_olig_percent <- ggplot(df.iba.olig_long_percent, aes(
  x = as.factor(Timepoint), y = Value,
  fill = as.factor(Timepoint), color = as.factor(Timepoint)
)) +
  geom_bar(stat = "identity", position = position_dodge(0.9)) +
  facet_wrap(~ Marker, scales = "free_y") +
  theme_bw() +
  ylim(0, 100) +
  labs(x = "Timepoints (DIV)", y = "Percentage (% DAPI)") +
  NoLegend()

# =============================================================================
# 🖼 Combine Plots
# =============================================================================

# Combine count plots
plot_grid(iba_olig_count, gfap.neun_count, labels = c("A", "B"))

# Combine percentage plots
plot_grid(iba_olig_percent, gfap.neun_percent, labels = c("C", "D"))

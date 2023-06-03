import type { NextPage } from "next";
import { Box, Text, Image } from "@chakra-ui/react";
import { useWindowState } from "../utils/recoil/window";
import { motion } from "framer-motion";
import { navVariants } from "../utils/animation";

const Home: NextPage = () => {
  const { width: windowWidth, height: windowHeight } = useWindowState();
  return (
    <Box
      className={"main"}
      display={"flex"}
      flexDir={"column"}
      alignItems={"center"}
      justifyContent={"center"}
      position={"relative"}
      h={`${windowHeight}px`}
      w={`${windowWidth}px`}
    >
      <Image
        alt={"landing-image"}
        w={`${windowWidth}px`}
        h={"100%"}
        objectFit={"cover"}
        position={"absolute"}
        src={
          "https://res.cloudinary.com/dbfpsigax/image/upload/v1685804937/circles/close-up-happy-people-posing-together_fizy1z.jpg"
        }
        zIndex={-1}
      />
      <motion.div variants={navVariants} initial="hidden" whileInView={"show"}>
        <Text fontSize={"96px"}>Circles</Text>
      </motion.div>
    </Box>
  );
};

export default Home;
